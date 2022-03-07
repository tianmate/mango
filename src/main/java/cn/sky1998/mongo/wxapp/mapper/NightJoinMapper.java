package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.NightJoin;
import cn.sky1998.mongo.wxapp.domain.NightJoinPlanUserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NightJoinMapper {
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
    int insert(NightJoin record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(NightJoin record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    NightJoin selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(NightJoin record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(NightJoin record);

    List<NightJoinPlanUserVo> getList(NightJoin record);

    List<NightJoinPlanUserVo> getListByPlanId(NightJoin record);
}