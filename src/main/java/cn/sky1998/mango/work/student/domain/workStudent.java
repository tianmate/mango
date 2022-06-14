package cn.sky1998.mango.work.student.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import cn.sky1998.mango.framework.web.core.entity.BaseEntity;

/**
 * 学生成绩管理对象 work_student
 * 
 * @author tcy
 * @date 2022-04-26
 */
public class workStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private java.math.BigInteger id;

    /** 学号 */
    private String code;

    /** 姓名 */
    private String name;

    /** 成绩 */
    private int num;

    /** 课程 */
    private String course;

    public void setId(java.math.BigInteger id) 
    {
        this.id = id;
    }

    public java.math.BigInteger getId() 
    {
        return id;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setNum(int num) 
    {
        this.num = num;
    }

    public int getNum() 
    {
        return num;
    }
    public void setCourse(String course) 
    {
        this.course = course;
    }

    public String getCourse() 
    {
        return course;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("name", getName())
            .append("num", getNum())
            .append("course", getCourse())
            .toString();
    }
}
