package cn.sky1998.mongo.system.wxapp.domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.List;

public class BaseWxModel {

    @XStreamAlias("ToUserName") //发送者微信
    private String ToUserName;
    @XStreamAlias("FromUserName")//开发者微信号
    private String FromUserName;
    @XStreamAlias("CreateTime")//	发送方帐号（一个OpenID）
    private String CreateTime;
    @XStreamAlias("MsgType")//	消息创建时间 （整型）
    private String msgType;
    @XStreamAlias("MsgId")//	消息类型，event
    private String msgId; //用于排查

    @XStreamAlias("EventKey")
    private String eventKey; //菜单key

    @XStreamAlias("Event")
    private String Event; //事件类型

    @XStreamAlias("PicUrl")
    private String PicUrl; //图片url

    @XStreamAlias("ArticleCount")
    private String ArticleCount; //图文消息个数

    @XStreamAlias("Articles")
    private List<Article> Articles;

    private Image Image;
    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        this.ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.FromUserName = fromUserName;
    }

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        this.CreateTime = createTime;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public String getEventKey() {
        return eventKey;
    }

    public void setEventKey(String eventKey) {
        this.eventKey = eventKey;
    }

    public String getEvent() {
        return Event;
    }

    public void setEvent(String event) {
        Event = event;
    }

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }

    public String getArticleCount() {
        return ArticleCount;
    }

    public void setArticleCount(String articleCount) {
        ArticleCount = articleCount;
    }

    public List<Article> getArticles() {
        return Articles;
    }

    public void setArticles(List<Article> articles) {
        this.Articles = articles;
    }

    public Image getImage() {
        return Image;
    }

    public void setImage(Image image) {
        this.Image = image;
    }
}
