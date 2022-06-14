package cn.sky1998.mango.work.teacher.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import cn.sky1998.mango.framework.web.core.entity.BaseEntity;

/**
 * 教师管理对象 test_teacher
 * 
 * @author tcy
 * @date 2022-04-21
 */
public class testTeacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 姓名 */
    private String name;

    /** 课程 */
    private String course;

    /** 主键 */
    private java.math.BigInteger id;

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setCourse(String course) 
    {
        this.course = course;
    }

    public String getCourse() 
    {
        return course;
    }
    public void setId(java.math.BigInteger id) 
    {
        this.id = id;
    }

    public java.math.BigInteger getId() 
    {
        return id;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("name", getName())
            .append("course", getCourse())
            .append("id", getId())
            .toString();
    }
}
