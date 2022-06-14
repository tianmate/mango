package cn.sky1998.mango.system.domain.form;

import cn.sky1998.mango.system.domain.Menu;
import cn.sky1998.mango.system.domain.Role;

import java.util.List;

/**
 * @author tcy@1753163342@qq.com
 * @Date 11-02-2022
 */
public class RoleMenuForm extends Role{

    private List<Menu> menus;

    private Long voId;

    private Byte del;

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