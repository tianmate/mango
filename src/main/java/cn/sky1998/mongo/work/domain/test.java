package cn.sky1998.mongo.work.domain;


import cn.sky1998.mongo.framework.web.core.entity.BaseEntity;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * test对象 test
 * 
 * @author test
 * @date 2022-04-20
 */
public class test extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .toString();
    }
}
