package cn.sky1998.mango.system.controller;

import cn.sky1998.mango.framework.aspect.annotation.AutoLog;
import cn.sky1998.mango.framework.web.core.BaseController;
import cn.sky1998.mango.framework.web.core.page.TableDataInfo;
import cn.sky1998.mango.system.domain.Account;
import cn.sky1998.mango.system.domain.AccountRoleVo;
import cn.sky1998.mango.system.domain.dto.AccountRoleDto;
import cn.sky1998.mango.system.domain.form.AccountForm;
import cn.sky1998.mango.system.domain.form.AccountRoleForm;
import cn.sky1998.mango.system.service.AccountService;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 账户管理
 * @author tcy@1753163342@qq.com
 * @Date 09-12-2021
 */
@RestController
@RequestMapping("/system/account")
public class AccountController extends BaseController {

    @Autowired
    private AccountService accountService;


    @PostMapping("/register")
    public AjaxResult register(@RequestBody Account sysAccount){
        return AjaxResult.success(accountService.insert(sysAccount));
    }


    @PostMapping("/getList")
    public TableDataInfo getList(@RequestBody AccountForm accountForm){
        return  getDataTable(accountService.getList(accountForm));
    }


    @PostMapping("/update")
    public AjaxResult update(@RequestBody Account sysAccount){
        return  AjaxResult.success(accountService.update(sysAccount));
    }

    @PreAuthorize("@ss.hasPermi('system:user:update')") //判断用户是否有操作该按钮的权限
    @PostMapping("/updateUserRole")
    public AjaxResult updateUserRole(@RequestBody AccountRoleDto accountRoleDto){
        return  AjaxResult.success(accountService.updateUserRole(accountRoleDto));
    }

    @PostMapping("/assignRole")
    public AjaxResult assignRole(@RequestBody AccountRoleForm accountRoleForm){
        return  AjaxResult.success(accountService.assignRole(accountRoleForm));
    }

    @PostMapping("/getUserRole")
    public AjaxResult getUserRole(@RequestBody Account account){
        return  AjaxResult.success(accountService.getUserRole(account));
    }

    //@PostMapping("/removeUserRole")
    //public AjaxResult removeUserRole(@RequestBody AccountRoleVo accountRoleVo){
    //    return  AjaxResult.success(accountService.removeUserRole(accountRoleVo));
    //}

    @PostMapping("/getUserMenu")
    public AjaxResult getUserMenu(@RequestBody Account account){
        return  AjaxResult.success(accountService.getUserMenu(account));
    }

    @GetMapping("/profile")
    public AjaxResult profile(){
        return  AjaxResult.success(accountService.profile());
    }

    @PostMapping("/updatePwd")
    public AjaxResult updatePwd(String oldPassword, String newPassword){
        return  AjaxResult.success(accountService.updatePwd(oldPassword,newPassword));
    }
}