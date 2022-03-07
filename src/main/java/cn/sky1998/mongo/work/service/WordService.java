package cn.sky1998.mongo.work.service;

import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.domain.model.SingleWordDto;

import java.util.List;
import java.util.concurrent.Future;


/**
 * 文本处理-分词HanLP.segment(sentence)，简体转繁体（DemoTraditionalChinese2SimplifiedChinese），繁体转简体，同义词库，，关键词提取DemoPhraseExtractor/DemoKeyword，名词识别，汉字转拼音DemoPinyin
 * @author tcy
 * @Date 10-12-2021
 */
public interface WordService {

    /**
     * 分词
     * @param word
     */
    public List<Word> segment(Word word);

    /**
     * 简体转繁体
     * @param word
     * @return
     */
    public Future<SingleWordDto> convertToTraditionalChinese(Word word) ;


    /**
     * 繁体转简体
     * @param word
     * @return
     */
    public SingleWordDto convertToSimpleChinese(Word word) ;

    /**
     * 汉字转拼音
     * @param word
     * @return
     */
    public SingleWordDto convertToPinyin(Word word) ;

    /**
     * 同义词查找
     */
    public SingleWordDto synonymous(Word word);
}