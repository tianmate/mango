package cn.sky1998.mongo.work.service;

import cn.sky1998.mongo.work.domain.entity.Word;
import cn.sky1998.mongo.work.domain.model.ParagraphOut;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

/**
 * 文章智能化-情感分析（DemoSentimentAnalysis中），中文摘要（HanLP.extractSummary(document, 3)），文章伪原创CoreSynonymDictionary.rewrite(text)，文章分类（DemoTextClassification中）
 */
public interface AiService {


    public Future<ParagraphOut> textReplace(Word Article) throws ExecutionException, InterruptedException;

}
