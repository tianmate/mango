package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.mapper.KeywordMapper;
import cn.sky1998.mongo.wxapp.service.KeyWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class KeyWordServiceImpl implements KeyWordService {

    @Autowired
    private KeywordMapper keywordMapper;

    @Override
    public List<Keyword> getList(Keyword keyword) {
        return keywordMapper.getList(keyword);
    }

    @Override
    public int add(Keyword keyword) {
        return keywordMapper.insertSelective(keyword);
    }


    @Override
    public int update(Keyword keyword) {
        return keywordMapper.updateByPrimaryKeySelective(keyword);
    }

    @Override
    public Keyword selectByWord(String word) {
        return keywordMapper.selectByWord(word);
    }
}