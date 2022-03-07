package cn.sky1998.mongo.work.domain.model;

import cn.sky1998.mongo.work.domain.entity.Word;

/**
 * 单独一个词的dto
 * @author tcy
 * @Date 08-12-2021
 */
public class SingleWordDto {

    private Word OriginalText;

    private Object resultText;

    public Word getOriginalText() {
        return OriginalText;
    }

    public void setOriginalText(Word originalText) {
        OriginalText = originalText;
    }

    public Object getResultText() {
        return resultText;
    }

    public void setResultText(Object resultText) {
        this.resultText = resultText;
    }
}