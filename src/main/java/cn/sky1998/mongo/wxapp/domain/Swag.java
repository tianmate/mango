package cn.sky1998.mongo.wxapp.domain;

import cn.sky1998.mongo.framework.web.core.entity.BaseQuery;

import java.io.Serializable;
import java.util.Date;

/**
 * 交换表
 */
public class Swag extends BaseQuery implements Serializable {
    private Long id;

    /**
     * 发送者openid
     */
    private String openid;

    /**
     * 发送者openid
     */
    private String toOpenid;

    /**
     * 消息1
     */
    private String msg1;

    /**
     * 消息2
     */
    private String msg2;

    /**
     * 交换时间
     */
    private Date createTime;

    /**
     * 活动id
     */
    private Long planId;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getToOpenid() {
        return toOpenid;
    }

    public void setToOpenid(String toOpenid) {
        this.toOpenid = toOpenid;
    }

    public String getMsg1() {
        return msg1;
    }

    public void setMsg1(String msg1) {
        this.msg1 = msg1;
    }

    public String getMsg2() {
        return msg2;
    }

    public void setMsg2(String msg2) {
        this.msg2 = msg2;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", openid=").append(openid);
        sb.append(", toOpenid=").append(toOpenid);
        sb.append(", msg1=").append(msg1);
        sb.append(", msg2=").append(msg2);
        sb.append(", createTime=").append(createTime);
        sb.append(", planId=").append(planId);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Swag other = (Swag) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getOpenid() == null ? other.getOpenid() == null : this.getOpenid().equals(other.getOpenid()))
                && (this.getToOpenid() == null ? other.getToOpenid() == null : this.getToOpenid().equals(other.getToOpenid()))
                && (this.getMsg1() == null ? other.getMsg1() == null : this.getMsg1().equals(other.getMsg1()))
                && (this.getMsg2() == null ? other.getMsg2() == null : this.getMsg2().equals(other.getMsg2()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getPlanId() == null ? other.getPlanId() == null : this.getPlanId().equals(other.getPlanId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOpenid() == null) ? 0 : getOpenid().hashCode());
        result = prime * result + ((getToOpenid() == null) ? 0 : getToOpenid().hashCode());
        result = prime * result + ((getMsg1() == null) ? 0 : getMsg1().hashCode());
        result = prime * result + ((getMsg2() == null) ? 0 : getMsg2().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getPlanId() == null) ? 0 : getPlanId().hashCode());
        return result;
    }
}