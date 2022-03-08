package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.dto.MenuTree;
import cn.sky1998.mongo.system.mapper.MenuMapper;
import cn.sky1998.mongo.system.security.utils.SecurityUtils;
import cn.sky1998.mongo.system.service.MenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tcy
 * @Date 13-01-2022
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> getListByRole() {
        //根据当前用户的id获取菜单列表
        Long userId = SecurityUtils.getUserId();
        Account account=new Account();
        account.setId(userId);
        List<Menu> menus = menuMapper.selectListByAccountId(account);
        return menus;
    }

    @Override
    public int add(Menu menuResource) {
        return menuMapper.insertSelective(menuResource);
    }


    @Override
    public int update(Menu menuResource) {
        return menuMapper.updateByPrimaryKeySelective(menuResource);
    }

    @Override
    public List<Menu> getList(Menu query) {
//        PageHelper.startPage(1, 1);
        return menuMapper.selectList(query);
    }

    @Override
    public List<Menu> getMenuByUser(Account account) {

        return menuMapper.getMenuByUser(account);
    }

    @Override
    public List<MenuTree> tree() {
        //根据当前用户的id获取菜单列表
        Long userId = SecurityUtils.getUserId();
        Account account=new Account();
        account.setId(userId);
        List<MenuTree> menuTrees = menuMapper.RootTree(account);
        tree(menuTrees,userId);

        return menuTrees;
    }

    private void tree(List<MenuTree> components,Long userId) {
        for (MenuTree model : components) {
            if (!menuMapper.selectChildIsExist(model.getId()))
                continue;
            List<MenuTree> menuTrees = menuMapper.ChildTree(model.getId(), userId);
            model.setChild(menuTrees);
            tree(menuTrees, userId);
        }
    }
}