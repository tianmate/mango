package cn.sky1998.mango.system.wxapp.domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author tcy@1753163342@qq.com
 * @Date 18-02-2022
 */
@XmlRootElement(name="item")
public class Article {


    @XStreamAlias("Title")
    private String Title; //图文消息标题

    @XStreamAlias("Description")
    private String Description; //图文消息描述

    @XStreamAlias("PicUrl")
    private String PicUrl; //图片url

    @XStreamAlias("Url")
    private String Url; //图文消息URL

    public String getTitle() {
        return Title;
    }
    @XmlElement(name = "title")
    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }
}