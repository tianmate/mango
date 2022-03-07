package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.domain.Mesaage;
import cn.sky1998.mongo.wxapp.mapper.KeywordMapper;
import cn.sky1998.mongo.wxapp.mapper.MesaageMapper;
import cn.sky1998.mongo.wxapp.service.KeyWordService;
import cn.sky1998.mongo.wxapp.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MesaageMapper mesaageMapper;

    @Override
    public List<Mesaage> getList(Mesaage mesaage) {
        return mesaageMapper.getList(mesaage);
    }

    @Override
    public int add(Mesaage mesaage) {
        return mesaageMapper.insertSelective(mesaage);
    }

    @Override
    public int update(Mesaage mesaage) {
        return mesaageMapper.updateByPrimaryKeySelective(mesaage);
    }


}