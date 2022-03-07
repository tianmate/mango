package cn.sky1998.mongo.wxapp.service;

import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.domain.Plan;

import java.util.List;

public interface PlanService {

    List<Plan> getList(Plan plan);

    int add(Plan plan);

    int update(Plan plan);
}
