package cn.sky1998.mongo.system.domain.dto;

import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;

import java.util.List;

/**
 * @author tcy
 * @Date 12-04-2022
 */
public class RoleMenuDto extends Role {

    private List<Menu> menus;

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }
}