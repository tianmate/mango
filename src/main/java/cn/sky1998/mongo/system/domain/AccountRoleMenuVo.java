package cn.sky1998.mongo.system.domain;

/**
 * @author tcy
 * @Date 24-01-2022
 */
public class AccountRoleMenuVo {

    private Account account;

    private Role role;

    private Menu menu;

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}