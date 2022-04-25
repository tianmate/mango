package cn.sky1998.mongo.system.controller;

import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.system.domain.Role;
import cn.sky1998.mongo.system.domain.RoleMenuVo;
import cn.sky1998.mongo.system.domain.form.RoleMenuForm;
import cn.sky1998.mongo.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 角色管理
 * @author tcy@1753163342@qq.com
 * @Date 14-01-2022
 */
@RestController
@RequestMapping("/system/role")
public class RoleController {

    @Autowired
    private RoleService roleService;


    @PostMapping("/getList")
    public AjaxResult getlist(@RequestBody Role role){
        return AjaxResult.success(roleService.getlist(role));
    }

    @PostMapping("/add")
    public AjaxResult add(@RequestBody Role role){
        return AjaxResult.success(roleService.add(role));
    }

    @PostMapping("/getDatail")
    public AjaxResult getDatail(@RequestBody Role role){
        return AjaxResult.success(roleService.getDatail(role));
    }
    @PostMapping("/update")
    public AjaxResult update(@RequestBody Role role){
        return AjaxResult.success(roleService.update(role));
    }

    @PostMapping("/updateRoleMenu")
    public AjaxResult updateRoleMenu(@RequestBody Role role){
        return AjaxResult.success(roleService.updateRoleMenu(role));
    }

    @PostMapping("/assignMenu")
    public AjaxResult assignMenu(@RequestBody RoleMenuForm form){
        return AjaxResult.success(roleService.assignMenu(form));
    }

    @PostMapping("/getRoleMenu")
    public AjaxResult getRoleMenu(@RequestBody Role role){
        return AjaxResult.success(roleService.getRoleMenu(role));
    }

    @PostMapping("/removeRoleMenu")
    public AjaxResult removeRoleMenu(@RequestBody RoleMenuVo roleMenuVo){
        return AjaxResult.success(roleService.removeRoleMenu(roleMenuVo));
    }

}