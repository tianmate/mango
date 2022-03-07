package cn.sky1998.mongo.wxapp.Event;

import org.springframework.context.ApplicationEvent;

import java.time.Clock;

/**
 * @author tcy
 * @Date 18-02-2022
 */
public class SwagEvent extends ApplicationEvent {

    private String openid;

    private String msg;

    private Long SwagId;

    public SwagEvent(Object source) {
        super(source);
    }

    public SwagEvent() {
        super(new Object());
    }

    public SwagEvent(String openid,String msg,Long swagId) {
        this();
        this.openid = openid;
        this.msg = msg;
        this.SwagId = swagId;
    }

    public SwagEvent(Object source, Clock clock, String openid) {
        super(source, clock);
        this.openid = openid;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getSwagId() {
        return SwagId;
    }

    public void setSwagId(Long swagId) {
        SwagId = swagId;
    }
}