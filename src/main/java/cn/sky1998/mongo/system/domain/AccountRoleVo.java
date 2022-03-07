package cn.sky1998.mongo.system.domain;

/**
 * @author tcy
 * @Date 19-01-2022
 */
public class AccountRoleVo {

    private Account account;

    private Role role;

    private Long voId;

    private Byte del;

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

    public Long getVoId() {
        return voId;
    }

    public void setVoId(Long voId) {
        this.voId = voId;
    }

    public Byte getDel() {
        return del;
    }

    public void setDel(Byte del) {
        this.del = del;
    }
}