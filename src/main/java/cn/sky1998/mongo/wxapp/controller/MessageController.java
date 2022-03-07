package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.wxapp.domain.Mesaage;
import cn.sky1998.mongo.wxapp.domain.Plan;
import cn.sky1998.mongo.wxapp.service.MessageService;
import cn.sky1998.mongo.wxapp.service.PlanService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 消息记录管理
 * @author tcy
 * @Date 15-02-2022
 */
@RestController
@RequestMapping("/wechat/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Mesaage mesaage){
        return AjaxResult.success(messageService.add(mesaage));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Mesaage mesaage){
        return AjaxResult.success(messageService.update(mesaage));
    }

    @PostMapping("/getList")
    public AjaxResult getList(@RequestBody Mesaage mesaage){
        //分页插件使用
        if (mesaage.getPageNum()!=null&&mesaage.getPageSize()!=null){
            PageHelper.startPage(mesaage.getPageNum(),mesaage.getPageSize());
        }
        return AjaxResult.success(messageService.getList(mesaage));
    }
}