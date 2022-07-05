package cn.sky1998.mango.work.course.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import cn.sky1998.mango.framework.web.core.entity.BaseEntity;
import java.util.List;

/**
 * 课程管理对象 work_course
 * 
 * @author tcy
 * @date 2022-07-05
 */
public class workCourse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 课程名 */
    private String name;

    /** 授课教师 */
    private String teacher;

    /** 学生成绩管理信息 */
    private List<workStudent> workStudentList;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setTeacher(String teacher) 
    {
        this.teacher = teacher;
    }

    public String getTeacher() 
    {
        return teacher;
    }

    public List<workStudent> getworkStudentList()
    {
        return workStudentList;
    }

    public void setworkStudentList(List<workStudent> workStudentList)
    {
        this.workStudentList = workStudentList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("teacher", getTeacher())
            .append("workStudentList", getworkStudentList())
            .toString();
    }
}
