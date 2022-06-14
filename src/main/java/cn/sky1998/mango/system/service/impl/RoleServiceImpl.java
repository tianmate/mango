package cn.sky1998.mango.system.service.impl;

import cn.sky1998.mango.common.exception.CustomException;
import cn.sky1998.mango.system.domain.Menu;
import cn.sky1998.mango.system.domain.Role;
import cn.sky1998.mango.system.domain.RoleMenuVo;
import cn.sky1998.mango.system.domain.dto.RoleMenuDto;
import cn.sky1998.mango.system.domain.form.RoleMenuForm;
import cn.sky1998.mango.system.mapper.MenuMapper;
import cn.sky1998.mango.system.mapper.RoleMapper;
import cn.sky1998.mango.system.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional(rollbackFor = Exception.class)
    public int add(RoleMenuForm form) {
        if (Objects.isNull(form)){
            throw new CustomException("角色参数不能为空！");
        }
        //增加到角色表
        int i = roleMapper.insertSelective(form);

        //增加到角色-菜单
        roleMapper.assignMenu(form.getMenus(),form.getId());

        return i;
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
    @Transactional(rollbackFor = Exception.class)
    public int assignMenu(RoleMenuForm form) {
            //更新角色
        Role role=new Role();
        BeanUtils.copyProperties(form,role);
            roleMapper.updateByPrimaryKeySelective(role);
            //更新角色-菜单
            //删掉原有角色-菜单数据
            roleMapper.removeRoleMenuByRoleId(form.getId());


             return roleMapper.assignMenu(form.getMenus(),form.getId());
    }

    @Override
    public RoleMenuDto getRoleMenu(Role role) {

        //列表结构
        RoleMenuDto roleMenu = roleMapper.getRoleMenuRoot(role);

        //树形结构
        //if (Objects.nonNull(roleMenu)){
        //    tree(roleMenu.getMenus(),role.getId());
        //}

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
        return roleMapper.removeRoleMenu(roleMenuVo.getRole().getId(),roleMenuVo.getMenu().getMenuId());
    }
}