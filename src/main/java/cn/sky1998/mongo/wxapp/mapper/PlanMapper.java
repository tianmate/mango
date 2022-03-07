package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.Plan;
import org.apache.ibatis.annotations.Mapper;import java.util.List;

@Mapper
public interface PlanMapper {
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
    int insert(Plan record);

    /**
     * insert record to table selective
     *
     * @param record the record
     * @return insert count
     */
    int insertSelective(Plan record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    Plan selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Plan record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Plan record);

    List<Plan> getList(Plan record);

    Plan getPlan(Plan record);
}