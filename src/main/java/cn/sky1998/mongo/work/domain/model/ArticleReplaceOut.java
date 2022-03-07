package cn.sky1998.mongo.work.domain.model;


/**
 * 文章替换响应对象
 * Created by 尘心 on 2020/9/26 0026.
 */

public class ArticleReplaceOut {


    private String sourceText;


    private String replaceText;


    private Integer replaceCount;

    public String getSourceText() {
        return sourceText;
    }

    public void setSourceText(String sourceText) {
        this.sourceText = sourceText;
    }

    public String getReplaceText() {
        return replaceText;
    }

    public void setReplaceText(String replaceText) {
        this.replaceText = replaceText;
    }

    public Integer getReplaceCount() {
        return replaceCount;
    }

    public void setReplaceCount(Integer replaceCount) {
        this.replaceCount = replaceCount;
    }
}
