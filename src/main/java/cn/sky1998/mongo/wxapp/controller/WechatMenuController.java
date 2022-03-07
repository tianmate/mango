package cn.sky1998.mongo.wxapp.controller;

import cn.sky1998.mongo.wxapp.service.WeChatMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@RestController
@RequestMapping("/wechat/menu")
public class WechatMenuController {

    @Autowired
    private WeChatMenuService menuService;

    @RequestMapping("/getMenu")
    public String getMenu(){
        return menuService.getMenu();
    }
}