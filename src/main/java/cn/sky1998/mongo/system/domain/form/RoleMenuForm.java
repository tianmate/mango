package cn.sky1998.mongo.system.domain.form;

import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;

import java.util.List;

/**
 * @author tcy
 * @Date 11-02-2022
 */
public class RoleMenuForm {

    private Role role;

    private List<Menu> menus;

    private Long voId;

    private Byte del;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
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