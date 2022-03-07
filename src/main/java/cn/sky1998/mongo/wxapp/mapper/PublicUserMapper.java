package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.PublicUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PublicUserMapper {
    /**
     * delete by primary key
     *
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table
     *
     * @param record the record
     * @return insert count
     */
    int insert(PublicUser record);

    /**
     * insert record to table selective
     *
     * @param record the record
     * @return insert count
     */
    int insertSelective(PublicUser record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    PublicUser selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(PublicUser record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(PublicUser record);

    List<PublicUser> getList(PublicUser record);

    PublicUser getPublicUserByopenid(@Param("openid") String openid);
}