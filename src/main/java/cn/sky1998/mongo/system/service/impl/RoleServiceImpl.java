package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;
import cn.sky1998.mongo.system.domain.RoleMenuVo;
import cn.sky1998.mongo.system.domain.dto.RoleMenuDto;
import cn.sky1998.mongo.system.domain.form.RoleMenuForm;
import cn.sky1998.mongo.system.mapper.MenuMapper;
import cn.sky1998.mongo.system.mapper.RoleMapper;
import cn.sky1998.mongo.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * @author tcy@1753163342@qq.com
 * @Date 15-01-2022
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Role> getlist(Role role) {
        return roleMapper.getlist(role);
    }

    /**
     * 查询角色详情
     * @param role
     * @return
     */
    @Override
    public RoleMenuDto getDatail(Role role) {
        return null;
    }

    @Override
    public int add(Role role) {
        if (Objects.isNull(role)){
            throw new CustomException("角色参数不能为空！");
        }
        return roleMapper.insertSelective(role);
    }


    @Override
    public int update(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public int updateRoleMenu(Role role) {
        return 0;
    }

    @Override
    public int assignMenu(RoleMenuForm form) {

        return roleMapper.assignMenu(form.getMenus(),form.getRole().getId());
    }

    @Override
    public RoleMenuDto getRoleMenu(Role role) {

        RoleMenuDto roleMenu = roleMapper.getRoleMenuRoot(role);

        tree(roleMenu.getMenus(),role.getId());

        return roleMenu;
    }

    /**
     * 构建菜单树
     * @param components
     * @param roleId
     */
    private void tree(List<Menu> components,Long roleId) {
        for (Menu model : components) {
            if (!menuMapper.selectChildIsExist(model.getMenuId()))
                continue;
            List<Menu> menus = menuMapper.ChildTreeByRoleId(model.getMenuId(), roleId);
            model.setChildren(menus);
            tree(menus, roleId);
        }
    }

    @Override
    public int removeRoleMenu(RoleMenuVo roleMenuVo) {
        return roleMapper.removeRoleMenu(roleMenuVo);
    }
}