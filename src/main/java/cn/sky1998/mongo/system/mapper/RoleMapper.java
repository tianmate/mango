package cn.sky1998.mongo.system.mapper;

import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.Role;
import cn.sky1998.mongo.system.domain.RoleMenuVo;
import cn.sky1998.mongo.system.domain.dto.RoleMenuDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleMapper {
    /**
     * delete by primary key
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(Role record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Role record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Role selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Role record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Role record);

    List<Role> getlist(Role record);


    int assignMenu(@Param("list")List<Menu> menus , @Param("id") Long id);

    RoleMenuDto getRoleMenu(Role role);

    int removeRoleMenu(RoleMenuVo roleMenuVo);

    public int checkMenuExistRole(Long menuId);

    int addRoleMenu(@Param("roleId") Long roleId,@Param("menuId") Long menuId);
}