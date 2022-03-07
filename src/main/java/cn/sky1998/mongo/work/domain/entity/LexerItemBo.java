package cn.sky1998.mongo.work.domain.entity;

/**
 * @Description 词义分析业务对象
 * @Date 2020/9/18 15:49
 * @Author by 尘心
 */

public class LexerItemBo {

    /**	词汇的字符串  */
    private String item;

    /** 命名实体类型，命名实体识别算法使用。词性标注算法中，此项为空串 */
    private String ne;

    /** 词性，词性标注算法使用。命名实体识别算法中，此项为空串 */
    private String pos;

    /** 在text中的字节级offset */
    private int byte_offset;

    /** 字节级length */
    private int byte_length;

    /** 链指到知识库的URI，只对命名实体有效。对于非命名实体和链接不到知识库的命名实体，此项为空串 */
    private String uri;

    /** 词汇的标准化表达，主要针对时间、数字单位，没有归一化表达的，此项为空串 */
    private String formal;

    /** 基本词成分 */
    private String[] basic_words;

    /** 地址成分，非必需，仅对地址型命名实体有效，没有地址成分的，此项为空数组。 */
    private IocDetailsBo[] loc_details;

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getNe() {
        return ne;
    }

    public void setNe(String ne) {
        this.ne = ne;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public int getByte_offset() {
        return byte_offset;
    }

    public void setByte_offset(int byte_offset) {
        this.byte_offset = byte_offset;
    }

    public int getByte_length() {
        return byte_length;
    }

    public void setByte_length(int byte_length) {
        this.byte_length = byte_length;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getFormal() {
        return formal;
    }

    public void setFormal(String formal) {
        this.formal = formal;
    }

    public String[] getBasic_words() {
        return basic_words;
    }

    public void setBasic_words(String[] basic_words) {
        this.basic_words = basic_words;
    }

    public IocDetailsBo[] getLoc_details() {
        return loc_details;
    }

    public void setLoc_details(IocDetailsBo[] loc_details) {
        this.loc_details = loc_details;
    }
}
