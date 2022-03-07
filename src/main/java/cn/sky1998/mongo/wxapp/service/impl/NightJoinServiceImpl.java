package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.NightJoin;
import cn.sky1998.mongo.wxapp.domain.NightJoinPlanUserVo;
import cn.sky1998.mongo.wxapp.mapper.NightJoinMapper;
import cn.sky1998.mongo.wxapp.service.NightJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class NightJoinServiceImpl implements NightJoinService {

    @Autowired
    private NightJoinMapper nightJoinMapper;

    @Override
    public List<NightJoinPlanUserVo> getList(NightJoin nightJoin) {
        return nightJoinMapper.getList(nightJoin);
    }

    @Override
    public int add(NightJoin nightJoin) {
        return nightJoinMapper.insertSelective(nightJoin);
    }

    @Override
    public int update(NightJoin nightJoin) {
        return nightJoinMapper.updateByPrimaryKeySelective(nightJoin);
    }
}