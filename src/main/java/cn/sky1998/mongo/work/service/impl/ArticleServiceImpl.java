package cn.sky1998.mongo.work.service.impl;

import com.github.pagehelper.PageHelper;
import com.hankcs.hanlp.HanLP;
import cn.sky1998.mongo.common.exception.WorkException;
import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    private final Logger log = LoggerFactory.getLogger(ArticleServiceImpl.class);
    /**
     * 中文文章摘要
     * @param word
     * @return
     */
    public List<String> cutWords(Word word) {

        List<String> strings=null;
        log.debug("开始启动分词...");

        try {
            strings = HanLP.extractKeyword(word.getText(), 2);
            Object o=null;
            o.toString();
        } catch (Exception e) {
            throw new WorkException("业务异常");
        }

        return strings;
    }




}
