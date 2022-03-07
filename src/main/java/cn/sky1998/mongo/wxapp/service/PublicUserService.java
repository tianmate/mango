package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.PublicUser;

import java.util.List;

public interface PublicUserService {

    List<PublicUser> getList(PublicUser publicUser);

    int add(PublicUser publicUser);

    int update(PublicUser publicUser);
}
