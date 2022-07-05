package cn.sky1998.mango.work.course.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import cn.sky1998.mango.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import cn.sky1998.mango.work.course.domain.workStudent;
import cn.sky1998.mango.work.course.mapper.workCourseMapper;
import cn.sky1998.mango.work.course.domain.workCourse;
import cn.sky1998.mango.work.course.service.IworkCourseService;

/**
 * 课程管理Service业务层处理
 * 
 * @author tcy
 * @date 2022-07-05
 */
@Service
public class workCourseServiceImpl implements IworkCourseService 
{
    @Autowired
    private workCourseMapper workCourseMapper;

    /**
     * 查询课程管理
     * 
     * @param id 课程管理ID
     * @return 课程管理
     */
    @Override
    public workCourse selectworkCourseById(Long id)
    {
        return workCourseMapper.selectworkCourseById(id);
    }

    /**
     * 查询课程管理列表
     * 
     * @param workCourse 课程管理
     * @return 课程管理
     */
    @Override
    public List<workCourse> selectworkCourseList(workCourse workCourse)
    {
        return workCourseMapper.selectworkCourseList(workCourse);
    }

    /**
     * 新增课程管理
     * 
     * @param workCourse 课程管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertworkCourse(workCourse workCourse)
    {
        int rows = workCourseMapper.insertworkCourse(workCourse);
        insertworkStudent(workCourse);
        return rows;
    }

    /**
     * 修改课程管理
     * 
     * @param workCourse 课程管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateworkCourse(workCourse workCourse)
    {
        workCourseMapper.deleteworkStudentByCourse(workCourse.getId());
        insertworkStudent(workCourse);
        return workCourseMapper.updateworkCourse(workCourse);
    }

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的课程管理ID
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteworkCourseByIds(Long[] ids)
    {
        workCourseMapper.deleteworkStudentByCourses(ids);
        return workCourseMapper.deleteworkCourseByIds(ids);
    }

    /**
     * 删除课程管理信息
     * 
     * @param id 课程管理ID
     * @return 结果
     */
    @Override
    public int deleteworkCourseById(Long id)
    {
        workCourseMapper.deleteworkStudentByCourse(id);
        return workCourseMapper.deleteworkCourseById(id);
    }

    /**
     * 新增学生成绩管理信息
     * 
     * @param workCourse 课程管理对象
     */
    public void insertworkStudent(workCourse workCourse)
    {
        List<workStudent> workStudentList = workCourse.getworkStudentList();
        Long id = workCourse.getId();
        if (StringUtils.isNotNull(workStudentList))
        {
            List<workStudent> list = new ArrayList<workStudent>();
            for (workStudent workStudent : workStudentList)
            {
                workStudent.setCourse(id.toString());

                workStudent.setId(null);

                list.add(workStudent);
            }
            if (list.size() > 0)
            {
                workCourseMapper.batchworkStudent(list);
            }
        }
    }
}
