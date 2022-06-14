package cn.sky1998.mango.system.mapper;

import cn.sky1998.mango.system.domain.SysMenu;

public interface SysMenuMapper {
    /**
     * delete by primary key
     *
     * @param menuId primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long menuId);

    /**
     * insert record to table
     *
     * @param record the record
     * @return insert count
     */
    int insert(SysMenu record);

    /**
     * insert record to table selective
     *
     * @param record the record
     * @return insert count
     */
    int insertSelective(SysMenu record);

    /**
     * select by primary key
     *
     * @param menuId primary key
     * @return object by primary key
     */
    SysMenu selectByPrimaryKey(Long menuId);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(SysMenu record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(SysMenu record);
}