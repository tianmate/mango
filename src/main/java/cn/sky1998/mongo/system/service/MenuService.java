package cn.sky1998.mongo.system.service;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.dto.MenuTree;
import cn.sky1998.mongo.system.domain.dto.RouterVo;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface MenuService {

    List<Menu> getListByRole();

    int add(Menu menu);

    int update(Menu menu);

    List<MenuTree> getList(Menu query);

    List<Menu> getMenuByUser(Account account);

    List<MenuTree> tree();

    Menu getDatail(Menu menu);

    /**
     * 构建前端路由所需要的菜单
     *
     * @param menus 菜单列表
     * @return 路由列表
     */
    public List<RouterVo> buildMenus(List<MenuTree> menus);
}
