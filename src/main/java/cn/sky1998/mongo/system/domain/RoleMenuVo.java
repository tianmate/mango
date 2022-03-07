package cn.sky1998.mongo.system.domain;

/**
 * @author tcy
 * @Date 21-01-2022
 */
public class RoleMenuVo {

    private Role role;

    private Menu menu;

    private Long voId;

    private Byte del;

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

    @Override
    public String toString() {
        return "RoleMenuVo{" +
                "role=" + role +
                ", menu=" + menu +
                '}';
    }
}