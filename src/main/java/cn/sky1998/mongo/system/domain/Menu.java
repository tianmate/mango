package cn.sky1998.mongo.system.domain;

import cn.sky1998.mongo.system.domain.dto.MenuTree;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
    * 菜单资源表
    */
public class Menu implements Serializable {
    /**
    * 主键
    */
    private Long id;

    /**
    * 组件名称
    */
    private String name;

    /**
    * 描述
    */
    private String description;

    /**
    * 父组件id
    */
    private Long parentId;

    /**
    * 路由地址
    */
    private String path;


    /**
    * 显示状态
    */
    private Byte hidden;

    /**
    * 图标
    */
    private String icon;

    /**
    * 同级优先级
    */
    private Short order;

    /**
    * 可用状态
    */
    private Byte enable;

    /**
    * 删除标记
    */
    private Byte del;

    /**
    * 备注
    */
    private String remark;

    private List<MenuTree> child;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Byte getHidden() {
        return hidden;
    }

    public void setHidden(Byte hidden) {
        this.hidden = hidden;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Short getOrder() {
        return order;
    }

    public void setOrder(Short order) {
        this.order = order;
    }

    public Byte getEnable() {
        return enable;
    }

    public void setEnable(Byte enable) {
        this.enable = enable;
    }

    public Byte getDel() {
        return del;
    }

    public void setDel(Byte del) {
        this.del = del;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<MenuTree> getChild() {
        return child;
    }

    public void setChild(List<MenuTree> child) {
        this.child = child;
    }
}