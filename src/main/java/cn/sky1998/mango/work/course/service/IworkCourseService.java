package cn.sky1998.mango.work.course.service;

import java.util.List;
import cn.sky1998.mango.work.course.domain.workCourse;

/**
 * 课程管理Service接口
 * 
 * @author tcy
 * @date 2022-07-05
 */
public interface IworkCourseService 
{
    /**
     * 查询课程管理
     * 
     * @param id 课程管理ID
     * @return 课程管理
     */
    public workCourse selectworkCourseById(Long id);

    /**
     * 查询课程管理列表
     * 
     * @param workCourse 课程管理
     * @return 课程管理集合
     */
    public List<workCourse> selectworkCourseList(workCourse workCourse);

    /**
     * 新增课程管理
     * 
     * @param workCourse 课程管理
     * @return 结果
     */
    public int insertworkCourse(workCourse workCourse);

    /**
     * 修改课程管理
     * 
     * @param workCourse 课程管理
     * @return 结果
     */
    public int updateworkCourse(workCourse workCourse);

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的课程管理ID
     * @return 结果
     */
    public int deleteworkCourseByIds(Long[] ids);

    /**
     * 删除课程管理信息
     * 
     * @param id 课程管理ID
     * @return 结果
     */
    public int deleteworkCourseById(Long id);
}
