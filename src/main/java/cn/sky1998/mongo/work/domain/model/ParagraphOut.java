package cn.sky1998.mongo.work.domain.model;

/**
 * 文章段落替换结果返回
 * Created by 尘心 on 2020/9/26 0026.
 */
public class ParagraphOut {

    private String result;

    private int total;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public ParagraphOut(String result, int total) {
        this.result = result;
        this.total = total;
    }

    public ParagraphOut() {
    }
}
