package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.Swag;
import cn.sky1998.mongo.wxapp.domain.SwagPublicUserPlanVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SwagMapper {
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
    int insert(Swag record);

    /**
     * insert record to table selective
     *
     * @param record the record
     * @return insert count
     */
    int insertSelective(Swag record);

    /**
     * select by primary key
     *
     * @param id primary key
     * @return object by primary key
     */
    Swag selectByPrimaryKey(Long id);

    /**
     * update record selective
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Swag record);

    /**
     * update record
     *
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Swag record);

    List<Swag> search(String openid);

    Swag getSwag(String openid);

    Swag getSwagTo(String ToOpenid);

    List<SwagPublicUserPlanVo> getList(Swag record);

    List<Swag> getListBySwag(Swag record);

    Swag getSwagBySwag(Swag record);
}