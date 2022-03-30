package cn.sky1998.mongo.system.wxapp.domain;

/**
 * @author tcy@1753163342@qq.com
 * @Date 17-02-2022
 */
public class BaseContent {

    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "BaseContent{" +
                "content='" + content + '\'' +
                '}';
    }
}