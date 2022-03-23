package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.AccountRoleVo;
import cn.sky1998.mongo.system.domain.form.AccountForm;
import cn.sky1998.mongo.system.domain.form.AccountRoleForm;
import cn.sky1998.mongo.system.service.AccountService;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 账户管理
 * @author tcy
 * @Date 09-12-2021
 */
@RestController
@RequestMapping("/system/account")
public class AccountController {

    @Autowired
    private AccountService accountService;


    @PostMapping("/register")
    public AjaxResult register(@RequestBody Account sysAccount){
        return AjaxResult.success(accountService.insert(sysAccount));
    }


    @PostMapping("/getList")
    public AjaxResult getList(@RequestBody AccountForm accountForm){
        return  AjaxResult.success(accountService.getList(accountForm));
    }

    @PostMapping("/update")
    public AjaxResult update(@RequestBody Account sysAccount){
        return  AjaxResult.success(accountService.update(sysAccount));
    }

    @PostMapping("/remove")
    public AjaxResult remove(@RequestBody Account sysAccount){
        return  AjaxResult.success(accountService.remove(sysAccount));
    }

    @PostMapping("/assignRole")
    public AjaxResult assignRole(@RequestBody AccountRoleForm accountRoleForm){
        return  AjaxResult.success(accountService.assignRole(accountRoleForm));
    }

    @PostMapping("/getUserRole")
    public AjaxResult getUserRole(@RequestBody Account account){
        return  AjaxResult.success(accountService.getUserRole(account));
    }

    @PostMapping("/removeUserRole")
    public AjaxResult removeUserRole(@RequestBody AccountRoleVo accountRoleVo){
        return  AjaxResult.success(accountService.removeUserRole(accountRoleVo));
    }

    @PostMapping("/getUserMenu")
    public AjaxResult getUserMenu(@RequestBody Account account){
        return  AjaxResult.success(accountService.getUserMenu(account));
    }

    @GetMapping("/profile")
    public AjaxResult profile(){
        return  AjaxResult.success(accountService.profile());
    }
}