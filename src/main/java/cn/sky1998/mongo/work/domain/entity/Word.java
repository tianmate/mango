package cn.sky1998.mongo.work.domain.entity;


import javax.validation.constraints.NotBlank;

/**
 * @author tcy
 * @Date 08-12-2021
 */

public class Word {

    @NotBlank
    private String text;

    private String nature;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    @Override
    public String toString() {
        return "Word{" +
                "text='" + text + '\'' +
                ", nature='" + nature + '\'' +
                '}';
    }
}