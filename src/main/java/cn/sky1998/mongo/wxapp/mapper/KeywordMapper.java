package cn.sky1998.mongo.wxapp.mapper;

import cn.sky1998.mongo.wxapp.domain.Keyword;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface KeywordMapper {
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
    int insert(Keyword record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Keyword record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Keyword selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Keyword record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Keyword record);

    List<Keyword> getList(Keyword record);

    Keyword selectByWord(@Param("word") String word);
}