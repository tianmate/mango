package cn.sky1998.mango.system.domain.dto;


import java.util.Objects;

/**
 * 查询多个字典时用到
 * @author: jeecg-boot
 */

public class DictModelMany extends DictModel {

    /**
     * 字典code，根据多个字段code查询时才用到，用于区分不同的字典选项
     */
    private String dictCode;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        DictModelMany that = (DictModelMany) o;
        return Objects.equals(dictCode, that.dictCode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), dictCode);
    }

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode;
    }
}
