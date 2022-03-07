package cn.sky1998.mongo.work.domain.model;


/**
 * 文本替换结果
 * Created by 尘心 on 2020/9/26 0026.
 */

public class ReplaceTextOut {

    private String source;

    private String replace;

    private Integer replaceCount;

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getReplace() {
        return replace;
    }

    public void setReplace(String replace) {
        this.replace = replace;
    }

    public Integer getReplaceCount() {
        return replaceCount;
    }

    public void setReplaceCount(Integer replaceCount) {
        this.replaceCount = replaceCount;
    }
}
