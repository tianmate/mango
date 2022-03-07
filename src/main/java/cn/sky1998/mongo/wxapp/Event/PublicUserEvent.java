package cn.sky1998.mongo.wxapp.Event;

import org.springframework.context.ApplicationEvent;

import java.time.Clock;

/**
 * @author tcy
 * @Date 22-02-2022
 */
public class PublicUserEvent extends ApplicationEvent {

    private String openid;

    public PublicUserEvent() {
        super(new Object());
    }

    public PublicUserEvent(String openid) {
        this();
        this.openid = openid;
    }

    public PublicUserEvent(Object source, Clock clock, String openid) {
        super(source, clock);
        this.openid = openid;
    }


    public PublicUserEvent(Object source, Clock clock) {
        super(source, clock);
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }
}