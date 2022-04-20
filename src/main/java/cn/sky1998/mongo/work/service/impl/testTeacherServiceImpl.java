package cn.sky1998.mongo.work.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.sky1998.mongo.work.mapper.testTeacherMapper;
import cn.sky1998.mongo.work.domain.testTeacher;
import cn.sky1998.mongo.work.service.ItestTeacherService;

/**
 * teacher_fucService业务层处理
 * 
 * @author tcy
 * @date 2022-04-20
 */
@Service
public class testTeacherServiceImpl implements ItestTeacherService 
{
    @Autowired
    private testTeacherMapper testTeacherMapper;

    /**
     * 查询teacher_fuc
     * 
     * @param id teacher_fucID
     * @return teacher_fuc
     */
    @Override
    public testTeacher selecttestTeacherById(java.math.BigInteger id)
    {
        return testTeacherMapper.selecttestTeacherById(id);
    }

    /**
     * 查询teacher_fuc列表
     * 
     * @param testTeacher teacher_fuc
     * @return teacher_fuc
     */
    @Override
    public List<testTeacher> selecttestTeacherList(testTeacher testTeacher)
    {
        return testTeacherMapper.selecttestTeacherList(testTeacher);
    }

    /**
     * 新增teacher_fuc
     * 
     * @param testTeacher teacher_fuc
     * @return 结果
     */
    @Override
    public int inserttestTeacher(testTeacher testTeacher)
    {
        return testTeacherMapper.inserttestTeacher(testTeacher);
    }

    /**
     * 修改teacher_fuc
     * 
     * @param testTeacher teacher_fuc
     * @return 结果
     */
    @Override
    public int updatetestTeacher(testTeacher testTeacher)
    {
        return testTeacherMapper.updatetestTeacher(testTeacher);
    }

    /**
     * 批量删除teacher_fuc
     * 
     * @param ids 需要删除的teacher_fucID
     * @return 结果
     */
    @Override
    public int deletetestTeacherByIds(java.math.BigInteger[] ids)
    {
        return testTeacherMapper.deletetestTeacherByIds(ids);
    }

    /**
     * 删除teacher_fuc信息
     * 
     * @param id teacher_fucID
     * @return 结果
     */
    @Override
    public int deletetestTeacherById(java.math.BigInteger id)
    {
        return testTeacherMapper.deletetestTeacherById(id);
    }
}
