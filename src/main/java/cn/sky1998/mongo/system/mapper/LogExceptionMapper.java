package cn.sky1998.mongo.system.mapper;

import cn.sky1998.mongo.system.domain.LogException;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogExceptionMapper {
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
    int insert(LogException record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(LogException record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    LogException selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(LogException record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(LogException record);
}