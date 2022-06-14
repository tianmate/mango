package cn.sky1998.mango.system.service;

import cn.sky1998.mango.system.domain.Menu;
import cn.sky1998.mango.system.domain.Role;
import cn.sky1998.mango.system.domain.RoleMenuVo;
import cn.sky1998.mango.system.domain.dto.RoleMenuDto;
import cn.sky1998.mango.system.domain.form.RoleMenuForm;

import java.util.List;

public interface RoleService {

    List<Role> getlist(Role role);

    RoleMenuDto getDatail(Role role);

    int add(RoleMenuForm form);

    int update(Role role);

    int updateRoleMenu(Role role);

    int assignMenu(RoleMenuForm form);

    RoleMenuDto getRoleMenu(Role role);

    int removeRoleMenu(RoleMenuVo roleMenuVo);
}
