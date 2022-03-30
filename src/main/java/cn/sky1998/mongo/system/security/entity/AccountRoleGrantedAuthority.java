package cn.sky1998.mongo.system.security.entity;

import cn.sky1998.mongo.system.domain.Role;
import org.springframework.security.core.GrantedAuthority;

/**
 * @author tcy@1753163342@qq.com
 * @Date 19-01-2022
 */
public class AccountRoleGrantedAuthority implements GrantedAuthority {

    private Role sysRole;

    @Override
    public String getAuthority() {
        return null;
    }

    public Role getSysRole() {
        return sysRole;
    }

    public void setSysRole(Role sysRole) {
        this.sysRole = sysRole;
    }
}