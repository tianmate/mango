package cn.sky1998.mongo.work.domain.model;

/**
 * @Description 文本DTO对象
 * @Date 2020/9/18 15:32
 * @Author by 尘心
 */

public class TextDto {

    private String text;

    public TextDto(String s) {
        this.text=s;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public TextDto() {
    }
}
