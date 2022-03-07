package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.Swag;
import cn.sky1998.mongo.wxapp.domain.SwagPublicUserPlanVo;

import java.util.List;

/**
 * @author tcy
 * @Date 18-02-2022
 */
public interface SwagService {

     Swag search(String openid);

     Swag getSwagByid(Long id);

     int updata(Swag swag);

     int add(Swag swag);

     List<SwagPublicUserPlanVo> getList(Swag swag);
}