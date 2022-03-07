package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author tcy
 * @Date 21-01-2022
 */
@RestController
@RequestMapping("/system/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @PostMapping("/common")
    public AjaxResult login(@RequestBody Account sysAccount ){
        return  AjaxResult.success(loginService.commonLogin(sysAccount));
    }

    @PostMapping("/gzhLogin")
    public AjaxResult gzhLogin(@RequestBody Account sysAccount ){
        return  AjaxResult.success(loginService.gzhLogin(sysAccount));
    }
}