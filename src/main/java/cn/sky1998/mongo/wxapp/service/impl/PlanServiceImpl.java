package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.mapper.PlanMapper;
import cn.sky1998.mongo.wxapp.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class PlanServiceImpl implements PlanService {

    @Autowired
    private PlanMapper planMapper;

    @Override
    public List<Plan> getList(Plan plan) {
        return planMapper.getList(plan);
    }

    @Override
    public int add(Plan plan) {
        plan.setCreateTime(new Date());
        return planMapper.insertSelective(plan);
    }

    @Override
    public int update(Plan plan) {
        return planMapper.updateByPrimaryKeySelective(plan);
    }
}