package cn.sky1998.mango.system.wxapp.domain;

public class ContentMsg extends BaseWxModel{

    private String content;//文本

    public String getContent() {
        return content;
    }

    @Override
    public String toString() {
        return "ContentMsg{" +
                "content='" + content + '\'' +
                '}';
    }

    public void setContent(String content) {
        this.content = content;
    }
}
