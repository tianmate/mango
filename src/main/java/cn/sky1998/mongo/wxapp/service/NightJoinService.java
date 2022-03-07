package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.NightJoin;
import cn.sky1998.mongo.wxapp.domain.NightJoinPlanUserVo;
import cn.sky1998.mongo.wxapp.domain.Plan;

import java.util.List;

public interface NightJoinService {

    List<NightJoinPlanUserVo> getList(NightJoin nightJoin);

    int add(NightJoin nightJoin);

    int update(NightJoin nightJoin);
}
