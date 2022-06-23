package cn.sky1998.mango.system.security.service;

import cn.sky1998.mango.system.domain.Account;
import cn.sky1998.mango.system.service.IMenuService;
import cn.sky1998.mango.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户权限处理
 * 
 * @author tcy@1753163342@qq.com
 */
@Component
public class SysPermissionService
{
    @Autowired
    private RoleService roleService;

    @Autowired
    private IMenuService menuService;

    /**
     * 获取角色数据权限
     * 
     * @param user 用户信息
     * @return 角色权限信息
     */
    public Set<String> getRolePermission(Account user)
    {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.getUsername().equals("admin"))
        {
            roles.add("admin");
        }
        else
        {
            roles.addAll(roleService.selectRolePermissionByUserId(user.getId()));
        }
        return roles;
    }

    /**
     * 获取菜单数据权限
     * 
     * @param user 用户信息
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermission(Account user)
    {
        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.getUsername().equals("admin"))
        {
            perms.add("*:*:*");
        }
        else
        {
            perms.addAll(menuService.selectMenuPermsByUserId(user.getId()));
        }
        return perms;
    }
}
