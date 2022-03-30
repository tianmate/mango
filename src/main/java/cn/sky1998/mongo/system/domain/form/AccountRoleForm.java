package cn.sky1998.mongo.system.domain.form;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Role;

import java.util.List;

/**
 * @author tcy@1753163342@qq.com
 * @Date 27-01-2022
 */
public class AccountRoleForm {

    private Account account;

    private List<Role> roles;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}