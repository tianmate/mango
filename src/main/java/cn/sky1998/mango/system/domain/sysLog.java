package cn.sky1998.mango.system.domain;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import cn.sky1998.mango.framework.web.core.entity.BaseEntity;

/**
 * 日志管理对象 sys_log
 * 
 * @author tcy
 * @date 2022-06-27
 */
public class sysLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private java.math.BigInteger id;

    /** 日志类型 */
    private int logType;

    /** 日志内容 */
    private String logContent;

    /** 操作类型(增删改查) */
    private int operateType;

    /** 用户名称 */
    private String username;

    /** ip */
    private String ip;

    /** 业务key */
    private String workKey;

    /** 业务value */
    private String workValue;

    /** 请求路径 */
    private String requestUrl;

    /** 请求参数 */
    private String requestParam;

    /** 请求java方法 */
    private String method;

    public void setId(java.math.BigInteger id) 
    {
        this.id = id;
    }

    public java.math.BigInteger getId() 
    {
        return id;
    }
    public void setLogType(int logType) 
    {
        this.logType = logType;
    }

    public int getLogType() 
    {
        return logType;
    }
    public void setLogContent(String logContent) 
    {
        this.logContent = logContent;
    }

    public String getLogContent() 
    {
        return logContent;
    }
    public void setOperateType(int operateType) 
    {
        this.operateType = operateType;
    }

    public int getOperateType() 
    {
        return operateType;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setWorkKey(String workKey) 
    {
        this.workKey = workKey;
    }

    public String getWorkKey() 
    {
        return workKey;
    }
    public void setWorkValue(String workValue) 
    {
        this.workValue = workValue;
    }

    public String getWorkValue() 
    {
        return workValue;
    }
    public void setRequestUrl(String requestUrl) 
    {
        this.requestUrl = requestUrl;
    }

    public String getRequestUrl() 
    {
        return requestUrl;
    }
    public void setRequestParam(String requestParam) 
    {
        this.requestParam = requestParam;
    }

    public String getRequestParam() 
    {
        return requestParam;
    }
    public void setMethod(String method) 
    {
        this.method = method;
    }

    public String getMethod() 
    {
        return method;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("logType", getLogType())
            .append("logContent", getLogContent())
            .append("operateType", getOperateType())
            .append("username", getUsername())
            .append("ip", getIp())
            .append("workKey", getWorkKey())
            .append("workValue", getWorkValue())
            .append("requestUrl", getRequestUrl())
            .append("requestParam", getRequestParam())
            .append("method", getMethod())
            .append("createTime", getCreateTime())
            .toString();
    }
}
