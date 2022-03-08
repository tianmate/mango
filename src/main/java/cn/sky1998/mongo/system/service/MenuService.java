package cn.sky1998.mongo.system.service;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.dto.MenuTree;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface MenuService {

    List<Menu> getListByRole();

    int add(Menu menu);

    int update(Menu menu);

    List<Menu> getList(Menu query);

    List<Menu> getMenuByUser(Account account);

    List<MenuTree> tree();
}
