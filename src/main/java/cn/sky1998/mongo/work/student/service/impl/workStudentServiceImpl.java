package cn.sky1998.mongo.work.student.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sky1998.mongo.work.student.mapper.workStudentMapper;
import cn.sky1998.mongo.work.student.domain.workStudent;
import cn.sky1998.mongo.work.student.service.IworkStudentService;

/**
 * 学生成绩管理Service业务层处理
 * 
 * @author tcy
 * @date 2022-04-26
 */
@Service
public class workStudentServiceImpl implements IworkStudentService 
{
    @Autowired
    private workStudentMapper workStudentMapper;

    /**
     * 查询学生成绩管理
     * 
     * @param id 学生成绩管理ID
     * @return 学生成绩管理
     */
    @Override
    public workStudent selectworkStudentById(java.math.BigInteger id)
    {
        return workStudentMapper.selectworkStudentById(id);
    }

    /**
     * 查询学生成绩管理列表
     * 
     * @param workStudent 学生成绩管理
     * @return 学生成绩管理
     */
    @Override
    public List<workStudent> selectworkStudentList(workStudent workStudent)
    {
        return workStudentMapper.selectworkStudentList(workStudent);
    }

    /**
     * 新增学生成绩管理
     * 
     * @param workStudent 学生成绩管理
     * @return 结果
     */
    @Override
    public int insertworkStudent(workStudent workStudent)
    {
        return workStudentMapper.insertworkStudent(workStudent);
    }

    /**
     * 修改学生成绩管理
     * 
     * @param workStudent 学生成绩管理
     * @return 结果
     */
    @Override
    public int updateworkStudent(workStudent workStudent)
    {
        return workStudentMapper.updateworkStudent(workStudent);
    }

    /**
     * 批量删除学生成绩管理
     * 
     * @param ids 需要删除的学生成绩管理ID
     * @return 结果
     */
    @Override
    public int deleteworkStudentByIds(java.math.BigInteger[] ids)
    {
        return workStudentMapper.deleteworkStudentByIds(ids);
    }

    /**
     * 删除学生成绩管理信息
     * 
     * @param id 学生成绩管理ID
     * @return 结果
     */
    @Override
    public int deleteworkStudentById(java.math.BigInteger id)
    {
        return workStudentMapper.deleteworkStudentById(id);
    }
}
