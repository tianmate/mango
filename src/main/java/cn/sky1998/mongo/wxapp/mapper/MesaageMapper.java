package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.Mesaage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MesaageMapper {
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
    int insert(Mesaage record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Mesaage record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Mesaage selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Mesaage record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Mesaage record);

    List<Mesaage> getList(Mesaage record);
}