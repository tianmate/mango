package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.domain.Mesaage;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
public interface MessageService {

    List<Mesaage> getList(Mesaage record);

    int add(Mesaage record);

    int update(Mesaage record);

}