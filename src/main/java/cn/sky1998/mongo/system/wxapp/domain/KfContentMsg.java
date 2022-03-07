package cn.sky1998.mongo.system.wxapp.domain;

/**
 * @author tcy
 * @Date 17-02-2022
 */
public class KfContentMsg {

    private String touser;

    private String msgtype;

    private BaseContent text;

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getMsgtype() {
        return msgtype;
    }

    public void setMsgtype(String msgtype) {
        this.msgtype = msgtype;
    }

    public BaseContent getText() {
        return text;
    }

    public void setText(BaseContent text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "KfContentMsg{" +
                "touser='" + touser + '\'' +
                ", msgtype='" + msgtype + '\'' +
                ", text=" + text +
                '}';
    }
}