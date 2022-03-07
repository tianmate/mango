package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.controller.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.entity.BaseQuery;
import cn.sky1998.mongo.framework.web.page.TableDataInfo;
import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.domain.Swag;
import cn.sky1998.mongo.wxapp.service.PlanService;
import cn.sky1998.mongo.wxapp.service.SwagService;
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
@RequestMapping("/wechat/swag")
public class SwagController extends BaseController {

    @Autowired
    private SwagService swagService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Swag swag){
        return AjaxResult.success(swagService.add(swag));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Swag swag){
        return AjaxResult.success(swagService.updata(swag));
    }

    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody Swag swag){
        //分页插件使用
        if (swag.getPageNum()!=null&&swag.getPageSize()!=null){
            PageHelper.startPage(swag.getPageNum(),swag.getPageSize());
        }
        return getDataTable(swagService.getList(swag));
    }
}