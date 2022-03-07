package cn.sky1998.mongo.system.service;

import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;
import cn.sky1998.mongo.system.domain.RoleMenuVo;
import cn.sky1998.mongo.system.domain.form.RoleMenuForm;

import java.util.List;

public interface RoleService {

    List<Role> getlist(Role role);

    int add(Role role);

    int update(Role role);

    int assignMenu(RoleMenuForm form);

    List<RoleMenuVo> getRoleMenu(Role role);

    int removeRoleMenu(RoleMenuVo roleMenuVo);
}
