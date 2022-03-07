package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.controller.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.entity.BaseQuery;
import cn.sky1998.mongo.framework.web.page.TableDataInfo;
import cn.sky1998.mongo.wxapp.domain.NightJoin;
import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.service.NightJoinService;
import cn.sky1998.mongo.wxapp.service.PlanService;
import com.github.pagehelper.PageHelper;
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
@RequestMapping("/wechat/nightJoin")
public class NightJoinController extends BaseController {

    @Autowired
    private NightJoinService nightJoinService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody NightJoin nightJoin){
        return AjaxResult.success(nightJoinService.add(nightJoin));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody NightJoin nightJoin){
        return AjaxResult.success(nightJoinService.update(nightJoin));
    }

    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody NightJoin nightJoin){
        //分页插件使用
        if (nightJoin.getPageNum()!=null&&nightJoin.getPageSize()!=null){
            PageHelper.startPage(nightJoin.getPageNum(),nightJoin.getPageSize());
        }
        return getDataTable(nightJoinService.getList(nightJoin));
    }
}