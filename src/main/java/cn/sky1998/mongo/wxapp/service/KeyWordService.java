package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.Keyword;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
public interface KeyWordService {

    List<Keyword> getList(Keyword keyword);

    int add(Keyword keyword);

    int update(Keyword keyword);

    Keyword selectByWord(String word);
}