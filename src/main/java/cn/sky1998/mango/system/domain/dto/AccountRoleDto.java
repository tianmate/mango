package cn.sky1998.mango.system.domain.dto;

import cn.sky1998.mango.system.domain.Account;
import cn.sky1998.mango.system.domain.Role;

import java.util.List;

/**
 * @author tcy
 * @Date 08-04-2022
 */
public class AccountRoleDto extends Account{

    private List<Role> roles;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

}