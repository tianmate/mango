package cn.sky1998.mango.work.course.mapper;

import java.util.List;
import cn.sky1998.mango.work.course.domain.workCourse;
import cn.sky1998.mango.work.course.domain.workStudent;

/**
 * 课程管理Mapper接口
 * 
 * @author tcy
 * @date 2022-07-05
 */
public interface workCourseMapper 
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
     * 删除课程管理
     * 
     * @param id 课程管理ID
     * @return 结果
     */
    public int deleteworkCourseById(Long id);

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteworkCourseByIds(Long[] ids);

    /**
     * 批量删除学生成绩管理
     * 
     * @param customerIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteworkStudentByCourses(Long[] ids);
    
    /**
     * 批量新增学生成绩管理
     * 
     * @param workStudentList 学生成绩管理列表
     * @return 结果
     */
    public int batchworkStudent(List<workStudent> workStudentList);
    

    /**
     * 通过课程管理ID删除学生成绩管理信息
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteworkStudentByCourse(Long id);
}
