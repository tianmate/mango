package cn.sky1998.mongo.work.domain.model;



import cn.sky1998.mongo.work.domain.entity.LexerItemBo;

import java.util.List;

/**
 * @Description 分词返回结果
 * @Date 2020/9/18 15:44
 * @Author by 尘心
 */

public class LexerOut {

    /** 日志ID */
    private String log_id;

    /** 原始单条请求文本 */
    private String text;

    /** 词汇数组，每个元素对应结果中的一个词 */
    private List<LexerItemBo> items;

    public String getLog_id() {
        return log_id;
    }

    public void setLog_id(String log_id) {
        this.log_id = log_id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<LexerItemBo> getItems() {
        return items;
    }

    public void setItems(List<LexerItemBo> items) {
        this.items = items;
    }
}
