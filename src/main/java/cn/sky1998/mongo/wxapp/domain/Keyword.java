package cn.sky1998.mongo.wxapp.domain;

import cn.sky1998.mongo.framework.web.entity.BaseQuery;

import java.io.Serializable;
import java.util.Objects;

/**
    * 关键字表
    */
public class Keyword extends BaseQuery implements Serializable {
    private Long id;

    private String word;

    private String reply;

    private Byte enable;

    private String remark;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Byte getEnable() {
        return enable;
    }

    public void setEnable(Byte enable) {
        this.enable = enable;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Keyword keyword = (Keyword) o;
        return Objects.equals(id, keyword.id) && Objects.equals(word, keyword.word) && Objects.equals(reply, keyword.reply) && Objects.equals(enable, keyword.enable) && Objects.equals(remark, keyword.remark);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, word, reply, enable, remark);
    }

    @Override
    public String toString() {
        return "Keyword{" +
                "id=" + id +
                ", word='" + word + '\'' +
                ", reply='" + reply + '\'' +
                ", enable=" + enable +
                ", remark='" + remark + '\'' +
                '}';
    }
}