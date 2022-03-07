package cn.sky1998.mongo.work.service.impl;

import cn.sky1998.mongo.framework.springutils.RedisUtils;
import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.domain.model.SingleWordDto;
import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.dictionary.py.Pinyin;
import com.hankcs.hanlp.seg.common.Term;
import cn.sky1998.mongo.common.exception.WorkException;
import cn.sky1998.mongo.system.domain.LogException;
import cn.sky1998.mongo.system.mapper.LogExceptionMapper;
import cn.sky1998.mongo.work.service.WordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Future;

/**
 * @author tcy
 * @Date 10-12-2021
 */
@Service
public class WordServiceImpl implements WordService {

    private final Logger log = LoggerFactory.getLogger(WordServiceImpl.class);

    @Autowired
    private LogExceptionMapper logExceptionMapper;

    /**
     * 中文分词
     * @param word
     */
    @Override
    public List<Word> segment(Word word) {
        List<Term> segment = HanLP.segment(word.getText());
        List<Word> words=new ArrayList<>(segment.size());

        for (int i = 0; i < segment.size(); i++) {
            Word word1=new Word();
            word1.setText(segment.get(i).word);
            word1.setNature(segment.get(i).nature.toString());
            words.add(word1);
        }

        return words;
    }

    /**
     * 中文转繁体字
     * @param word
     * @return
     */
    @Async
    public Future<SingleWordDto> convertToTraditionalChinese(Word word){

        SingleWordDto wordDto=new SingleWordDto();
        wordDto.setOriginalText(word);
        String textAfter = null;
        try {
            textAfter = HanLP.convertToTraditionalChinese(word.getText());
            wordDto.setResultText(textAfter);
        } catch (Exception e) {

            //异常使用存档
            LogException record=new LogException();
            record.setCreateTime(new Date());
            record.setExceptionLevel("work");
            record.setExceptionType("WorkException");

            logExceptionMapper.insert(record);
            throw new WorkException("业务异常");

        }
        //使用成功存档
        log.debug("简转繁成功"+Thread.currentThread().getName());

        return new AsyncResult<SingleWordDto>(wordDto);

    }

    /**
     * 繁体转简体
     * @param word
     * @return
     */
    @Override
    public SingleWordDto convertToSimpleChinese(Word word) {
        SingleWordDto singleWordDto=new SingleWordDto();
        singleWordDto.setOriginalText(word);
        String s = HanLP.tw2s(word.getText());
        singleWordDto.setResultText(s);
        return singleWordDto;
    }

    @Override
    public SingleWordDto convertToPinyin(Word word) {
        SingleWordDto singleWordDto=new SingleWordDto();
        singleWordDto.setOriginalText(word);
        List<Pinyin> pinyins = HanLP.convertToPinyinList(word.getText());
        singleWordDto.setResultText(pinyins);
        return singleWordDto;
    }

    /**
     * 同义词提取
     */
    @Override
    public SingleWordDto synonymous(Word word) {
        SingleWordDto wordDto=new SingleWordDto();
        Object value = RedisUtils.getValue(word.getText());
        wordDto.setOriginalText(word);
        if (Objects.nonNull(value)){
            wordDto.setResultText(value.toString());
        }
        return wordDto;
    }
}