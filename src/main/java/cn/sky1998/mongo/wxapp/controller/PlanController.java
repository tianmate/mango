package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.service.KeyWordService;
import cn.sky1998.mongo.wxapp.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 活动计划管理
 * @author tcy
 * @Date 15-02-2022
 */
@RestController
@RequestMapping("/wechat/plan")
public class PlanController {

    @Autowired
    private PlanService planService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Plan plan){
        return AjaxResult.success(planService.add(plan));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Plan plan){
        return AjaxResult.success(planService.update(plan));
    }

    @PostMapping("/getList")
    public AjaxResult getList(@RequestBody Plan plan){
        return AjaxResult.success(planService.getList(plan));
    }
}