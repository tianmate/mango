package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;
import cn.sky1998.mongo.system.domain.RoleMenuVo;
import cn.sky1998.mongo.system.domain.form.RoleMenuForm;
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

    @Override
    public List<Role> getlist(Role role) {
        return roleMapper.getlist(role);
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
    public int assignMenu(RoleMenuForm form) {

        return roleMapper.assignMenu(form.getMenus(),form.getRole().getId());
    }

    @Override
    public RoleMenuVo getRoleMenu(Role role) {
        return roleMapper.getRoleMenu(role);
    }

    @Override
    public int removeRoleMenu(RoleMenuVo roleMenuVo) {
        return roleMapper.removeRoleMenu(roleMenuVo);
    }
}