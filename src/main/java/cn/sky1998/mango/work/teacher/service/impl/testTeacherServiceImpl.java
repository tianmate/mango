package cn.sky1998.mango.work.teacher.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sky1998.mango.work.teacher.mapper.testTeacherMapper;
import cn.sky1998.mango.work.teacher.domain.testTeacher;
import cn.sky1998.mango.work.teacher.service.ItestTeacherService;

/**
 * 教师管理Service业务层处理
 * 
 * @author tcy
 * @date 2022-04-21
 */
@Service
public class testTeacherServiceImpl implements ItestTeacherService 
{
    @Autowired
    private testTeacherMapper testTeacherMapper;

    /**
     * 查询教师管理
     * 
     * @param id 教师管理ID
     * @return 教师管理
     */
    @Override
    public testTeacher selecttestTeacherById(java.math.BigInteger id)
    {
        return testTeacherMapper.selecttestTeacherById(id);
    }

    /**
     * 查询教师管理列表
     * 
     * @param testTeacher 教师管理
     * @return 教师管理
     */
    @Override
    public List<testTeacher> selecttestTeacherList(testTeacher testTeacher)
    {
        return testTeacherMapper.selecttestTeacherList(testTeacher);
    }

    /**
     * 新增教师管理
     * 
     * @param testTeacher 教师管理
     * @return 结果
     */
    @Override
    public int inserttestTeacher(testTeacher testTeacher)
    {
        return testTeacherMapper.inserttestTeacher(testTeacher);
    }

    /**
     * 修改教师管理
     * 
     * @param testTeacher 教师管理
     * @return 结果
     */
    @Override
    public int updatetestTeacher(testTeacher testTeacher)
    {
        return testTeacherMapper.updatetestTeacher(testTeacher);
    }

    /**
     * 批量删除教师管理
     * 
     * @param ids 需要删除的教师管理ID
     * @return 结果
     */
    @Override
    public int deletetestTeacherByIds(java.math.BigInteger[] ids)
    {
        return testTeacherMapper.deletetestTeacherByIds(ids);
    }

    /**
     * 删除教师管理信息
     * 
     * @param id 教师管理ID
     * @return 结果
     */
    @Override
    public int deletetestTeacherById(java.math.BigInteger id)
    {
        return testTeacherMapper.deletetestTeacherById(id);
    }
}
