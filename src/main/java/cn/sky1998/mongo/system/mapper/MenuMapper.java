package cn.sky1998.mongo.system.mapper;

import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.dto.MenuTree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MenuMapper {
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
    int insert(Menu record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Menu record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Menu selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Menu record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Menu record);

    /**
     * select by primary key
     * @param record
     * @return object by primary key
     */
    List<Menu> selectList(Menu record);

    List<Menu> selectListByAccountId(Account account);

    public List<Menu> getMenuByUser(Account account);

    List<MenuTree> RootTree(Account account);

    List<MenuTree> ChildTree( @Param("parentId") Long parentId,@Param("accountId") Long accountId);

    boolean selectChildIsExist(@Param("parentId") Long parentId);
}