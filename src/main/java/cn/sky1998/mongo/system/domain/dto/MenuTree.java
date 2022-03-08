package cn.sky1998.mongo.system.domain.dto;

import cn.sky1998.mongo.system.domain.Menu;

import java.util.List;

/**
 * @author tcy
 * @Date 08-03-2022
 */
public class MenuTree extends Menu {

    List<MenuTree> menuTrees;

    public List<MenuTree> getMenuTrees() {
        return menuTrees;
    }

    public void setMenuTrees(List<MenuTree> menuTrees) {
        this.menuTrees = menuTrees;
    }
}