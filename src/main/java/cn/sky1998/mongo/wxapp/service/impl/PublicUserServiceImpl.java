package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.PublicUser;
import cn.sky1998.mongo.wxapp.mapper.PublicUserMapper;
import cn.sky1998.mongo.wxapp.service.PublicUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class PublicUserServiceImpl implements PublicUserService {

    @Autowired
    private PublicUserMapper publicUserMapper;

    @Override
    public List<PublicUser> getList(PublicUser plan) {
        return publicUserMapper.getList(plan);
    }

    @Override
    public int add(PublicUser plan) {
        return publicUserMapper.insertSelective(plan);
    }

    @Override
    public int update(PublicUser plan) {
        return publicUserMapper.updateByPrimaryKeySelective(plan);
    }
}