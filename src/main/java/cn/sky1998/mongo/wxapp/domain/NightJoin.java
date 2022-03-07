package cn.sky1998.mongo.wxapp.domain;

import cn.sky1998.mongo.framework.web.entity.BaseQuery;

import java.io.Serializable;
import java.util.Date;

/**
    * 晚安计划表
    */
public class NightJoin extends BaseQuery implements Serializable {
    private Long id;

    private String openid;

    /**
    * 计划id
    */
    private Long planId;

    /**
    * 发送次数
    */
    private Integer sendNum;

    /**
    * 是否允许发送
    */
    private Integer sendEnable;

    /**
    * 报名时间
    */
    private Date createTime;

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

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
    }

    public Integer getSendNum() {
        return sendNum;
    }

    public void setSendNum(Integer sendNum) {
        this.sendNum = sendNum;
    }

    public Integer getSendEnable() {
        return sendEnable;
    }

    public void setSendEnable(Integer sendEnable) {
        this.sendEnable = sendEnable;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", openid=").append(openid);
        sb.append(", planId=").append(planId);
        sb.append(", sendNum=").append(sendNum);
        sb.append(", sendEnable=").append(sendEnable);
        sb.append(", createTime=").append(createTime);
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
        NightJoin other = (NightJoin) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getOpenid() == null ? other.getOpenid() == null : this.getOpenid().equals(other.getOpenid()))
            && (this.getPlanId() == null ? other.getPlanId() == null : this.getPlanId().equals(other.getPlanId()))
            && (this.getSendNum() == null ? other.getSendNum() == null : this.getSendNum().equals(other.getSendNum()))
            && (this.getSendEnable() == null ? other.getSendEnable() == null : this.getSendEnable().equals(other.getSendEnable()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOpenid() == null) ? 0 : getOpenid().hashCode());
        result = prime * result + ((getPlanId() == null) ? 0 : getPlanId().hashCode());
        result = prime * result + ((getSendNum() == null) ? 0 : getSendNum().hashCode());
        result = prime * result + ((getSendEnable() == null) ? 0 : getSendEnable().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }
}