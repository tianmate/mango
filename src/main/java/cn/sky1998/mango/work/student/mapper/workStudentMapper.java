package cn.sky1998.mango.work.student.mapper;

import java.util.List;
import cn.sky1998.mango.work.student.domain.workStudent;

/**
 * 学生成绩管理Mapper接口
 * 
 * @author tcy
 * @date 2022-04-26
 */
public interface workStudentMapper 
{
    /**
     * 查询学生成绩管理
     * 
     * @param id 学生成绩管理ID
     * @return 学生成绩管理
     */
    public workStudent selectworkStudentById(java.math.BigInteger id);

    /**
     * 查询学生成绩管理列表
     * 
     * @param workStudent 学生成绩管理
     * @return 学生成绩管理集合
     */
    public List<workStudent> selectworkStudentList(workStudent workStudent);

    /**
     * 新增学生成绩管理
     * 
     * @param workStudent 学生成绩管理
     * @return 结果
     */
    public int insertworkStudent(workStudent workStudent);

    /**
     * 修改学生成绩管理
     * 
     * @param workStudent 学生成绩管理
     * @return 结果
     */
    public int updateworkStudent(workStudent workStudent);

    /**
     * 删除学生成绩管理
     * 
     * @param id 学生成绩管理ID
     * @return 结果
     */
    public int deleteworkStudentById(java.math.BigInteger id);

    /**
     * 批量删除学生成绩管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteworkStudentByIds(java.math.BigInteger[] ids);
}
