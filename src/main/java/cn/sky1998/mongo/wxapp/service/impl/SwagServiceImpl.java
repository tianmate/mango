package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.wxapp.domain.Swag;
import cn.sky1998.mongo.wxapp.domain.SwagPublicUserPlanVo;
import cn.sky1998.mongo.wxapp.mapper.SwagMapper;
import cn.sky1998.mongo.wxapp.service.SwagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 18-02-2022
 */
@Service
public class SwagServiceImpl implements SwagService {

    @Autowired
    private SwagMapper swagMapper;

    @Override
    public Swag search(String openid) {

        List<Swag> search = swagMapper.search(openid);

        if (search.size()==0){

            return null;
        }else {
            //根据条件筛选返回一个

            return search.get(0);
        }

    }

    @Override
    public int updata(Swag swag) {
        return swagMapper.updateByPrimaryKeySelective(swag);
    }

    @Override
    public int add(Swag swag) {
        return swagMapper.insertSelective(swag);
    }

    @Override
    public List<SwagPublicUserPlanVo> getList(Swag swag) {
        return swagMapper.getList(swag);
    }

    @Override
    public Swag getSwagByid(Long id) {
        return swagMapper.selectByPrimaryKey(id);
    }
}