package cn.sky1998.mongo.work.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.sky1998.mongo.common.constant.AiConstant;
import cn.sky1998.mongo.common.constant.Constants;
import cn.sky1998.mongo.common.constant.LexerConstants;
import cn.sky1998.mongo.work.domain.entity.LexerItemBo;
import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.domain.model.*;
import cn.sky1998.mongo.work.service.AiService;
import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.dictionary.CoreSynonymDictionary;
import com.hankcs.hanlp.seg.common.Term;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

/**
 * @author tcy
 * @Date 20-12-2021
 */
@Service
public class AiServiceImpl implements AiService {

    Logger log= LoggerFactory.getLogger(AiServiceImpl.class);

    @Resource
    private RedisTemplate<String,Object> redisTemplate;

    /**
     * 文本伪原创
     * @param Article
     * @return
     */
    @Override
    @Async
    public Future<ParagraphOut> textReplace(Word Article) throws ExecutionException, InterruptedException {

        //切割段落
        List<String> paragraphs = sliceArticle(Article.getText());

        int size = paragraphs.size();
        if (size>35) {

        }

        StringBuilder sb = new StringBuilder();
        int replaceTotal = 0;
        int threadCount = 0;
        if (size>0) {
            log.info("开启多线程, 批量分析, 检测, 替换...");
            if (size == 1) {
                // 一个段落, 则分多个句子进行。 一个句子一个线程
                String p =  paragraphs.get(0);
                String[] sentence = p.split(Constants.PERIOD);
                for (String s : sentence) {
                    //文本切割、替换
                    Future<ArticleReplaceOut> asyncResult = getReplaceResult(s);
                    ArticleReplaceOut arOut =asyncResult.get();

                    sb.append(arOut.getReplaceText());

                    replaceTotal+=arOut.getReplaceCount();
                    if (asyncResult.isDone()) {
                        threadCount ++;
                    }
                }
            }else if (size>1) {
                // 有多少个段落, 则开多少线程, 最多不能超过35个线程
                for (int i = 0; i < size; i++) {
                    Future<ArticleReplaceOut> asyncResult = getReplaceResult(paragraphs.get(i));
                    ArticleReplaceOut arOut =asyncResult.get();

                    sb.append(arOut.getReplaceText());

                    replaceTotal+=arOut.getReplaceCount();
                    if (asyncResult.isDone()) {
                        threadCount ++;
                    }
                }
            }

        }

        while (threadCount < size) {
            Thread.sleep(100);
        }

        ParagraphOut paragraphOut = new ParagraphOut(sb.toString(), replaceTotal);
        return  new AsyncResult<ParagraphOut>(paragraphOut);
    }



    /**
     * 将文章进行切割
     * @param article 文章
     */
    private List<String> sliceArticle(String article) {
        List<String> sentenceList = new ArrayList<>();
        // 超过范围, 进行切割
        if (article.length()>Constants.MAX_LENGTH) {
            // 将文章全部切割成句子
            String[] sentences = article.split(Constants.PERIOD);
            // 获取句子总数
            int len = sentences.length;
            // 计数器
            int count = 0;
            // 计算总数
            int title = 0;
            // 段落拼接
            StringBuilder sb = new StringBuilder();
            for (String sentence : sentences) {
                sb.append(sentence);
                if (count == 10) {
                    // 存储切分的段落
                    sentenceList.add(sb.toString());
                    // 重新赋值
                    sb = new StringBuilder();
                    // 计数器清零
                    count = 0;
                }
                if (title == len) {
                    sentenceList.add(sb.toString());
                }

                title++;
                count++;

            }

        }else {
            sentenceList.add(article);
        }

        return sentenceList;
    }
    /**
     * 异步多线程处理段落
     */
    @Async
    public Future<ArticleReplaceOut> getReplaceResult(String sentence) {
        log.info("线程启动, 正在进行文本分析替换检测...");

        // 替换词数统计
        int total = 0;
        // 组合段落
        StringBuilder sb = new StringBuilder();
        // 逐句分析替换 切分的句子默认没有带"。"号
        String[] sen = sentence.split(Constants.PERIOD);
        for (String s : sen) {
            // 分析词义
            LexerOut lo = analyseLexer(new TextDto(s));
            System.out.println(lo);
            // 替换结果
            ReplaceTextOut reOut = sliceSentence(lo);
            String result = reOut.getReplace();
            total += reOut.getReplaceCount();
            // DNN语言模型检测
          //  DnnModelOut out = analyseDnnModel(new TextDto(result),accessToken);

                sb.append(result);
                if (!s.endsWith("。")) {
                    sb.append("。");
                }
        }

        ArticleReplaceOut arOut = new ArticleReplaceOut();
        arOut.setSourceText(sentence);
        arOut.setReplaceText(sb.toString());
        arOut.setReplaceCount(total);
        // 返回替换结果
        return new AsyncResult<>(arOut);
    }
    /**
     * 切割句子, 同义词替换
     */
    public ReplaceTextOut sliceSentence(LexerOut lexerOut) {
        if (lexerOut == null) {
           // throw new BizException(CommonEnum.PARAM_ERROR);
        }

        log.info("正在进行同义词替换...");

        // 替换词数统计
        int replaceCount = 0;
        // 需要从处理的词性数组
        String[] wordPos = {LexerConstants.A, LexerConstants.N,LexerConstants.V,LexerConstants.AD,LexerConstants.VD};
        List<String> posList = Arrays.asList(wordPos);

        StringBuilder builder = new StringBuilder();
        List<LexerItemBo> items = lexerOut.getItems();
        if (CollUtil.isNotEmpty(items)) {
            for (LexerItemBo item : items) {
                // 形容词, 动词, 名词(特有名词, 专属名词不进行处理)
                String pos = item.getPos();
                if (StrUtil.isNotBlank(pos)) {
                    if (posList.contains(pos)) {
                        String replaceWord = null;
                        // 替换成同义词
                        String sourceWord = item.getItem();
                        // 从redis同义词库中查找所有同义词
                        List<String> keys = new ArrayList<>();
                        //传入原词输出系列词+数字
                        Cursor<String> cursor = scan(redisTemplate,sourceWord+"*", AiConstant.KEYS_COUNT);
                        while (cursor.hasNext()) {
                            keys.add(cursor.next());
                        }

                        // 使用set, 去除相同的词, 提升替换效率
                        TreeSet<String> set = new TreeSet<>();
                        for (String key : keys) {
                            String similarWord = (String) redisTemplate.opsForValue().get(key);
                            set.add(similarWord);
                        }

                        List<String> similarList = new ArrayList<>();
                        for (String word : set) {
                            if (!StrUtil.isBlank(word)) {
                                //HanLP计算词义相似度
                                long distance = CoreSynonymDictionary.distance(sourceWord, word);
                                if (distance == 0) {
                                    // 将符合要求的同义词收集
                                    similarList.add(word);
                                }
                            }

                            log.info("找到如下同义词!"+word);

                        }

                        if (similarList.size()!=0) {
                            if (similarList.size() == 1) {
                                replaceWord = similarList.get(0);
                            }else {
                                Random rand = new Random();
                                String randomElement = similarList.get(rand.nextInt(similarList.size()));
                                if (!sourceWord.equals(randomElement)) {
                                    // 除去自己, 从最相似的词语当中随机取一个
                                    replaceWord = randomElement;
                                }
                                log.info("随机从相似词中取一个进行替换~");
                            }

                            replaceCount++;
                        }

                        // 句子重组
                        if (StrUtil.isBlank(replaceWord)) {
                            builder.append(sourceWord);
                        }else {
                            builder.append(replaceWord);
                        }

                    }else {
                        builder.append(item.getItem());
                    }
                }else {
                    builder.append(item.getItem());
                }

            }
        }

        // 封装返回对象
        ReplaceTextOut out = new ReplaceTextOut();
        out.setSource(lexerOut.getText());
        out.setReplace(builder.toString());
        out.setReplaceCount(replaceCount);

        return out;
    }

    /**
     * 将句子按照词义进行切分
     * @param text 文本对象
     */
    public LexerOut analyseLexer(TextDto text) {
        LexerOut lexerOut=new LexerOut();
        List<Term> segment = HanLP.segment(text.getText());
        lexerOut.setText(text.getText());

        List<LexerItemBo> lexerItemBos=new ArrayList<>();


        for (Term term : segment) {
            LexerItemBo lexerItemBo=new LexerItemBo();
            //分词
            lexerItemBo.setItem(term.word);
            //词性
            lexerItemBo.setPos(term.nature.toString());
            lexerItemBos.add(lexerItemBo);
        }
        lexerOut.setItems(lexerItemBos);
        return lexerOut;
    }
    /**
     * redis扫描相似键值
     */
    private Cursor<String> scan(RedisTemplate stringRedisTemplate, String match, int count){

        ScanOptions scanOptions = ScanOptions.scanOptions().match(match).count(count).build();

        RedisSerializer<String> redisSerializer = (RedisSerializer<String>) stringRedisTemplate.getKeySerializer();

        return (Cursor) stringRedisTemplate.executeWithStickyConnection((RedisCallback) redisConnection ->
                new ConvertingCursor<>(redisConnection.scan(scanOptions), redisSerializer::deserialize));
    }
}