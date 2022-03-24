package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.core.BaseController;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.framework.web.core.page.TableDataInfo;
import cn.sky1998.mongo.wxapp.domain.PublicUser;
import cn.sky1998.mongo.wxapp.service.PublicUserService;
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
@RequestMapping("/wechat/publicUser")
public class PublicUserController extends BaseController {

    @Autowired
    private PublicUserService publicUserService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody PublicUser plan){
        return AjaxResult.success(publicUserService.add(plan));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody PublicUser plan){
        return AjaxResult.success(publicUserService.update(plan));
    }

    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody PublicUser plan){
        //分页插件使用
        if (plan.getPageNum()!=null&&plan.getPageSize()!=null){
            PageHelper.startPage(plan.getPageNum(),plan.getPageSize());
        }
        return getDataTable(publicUserService.getList(plan));
    }
}