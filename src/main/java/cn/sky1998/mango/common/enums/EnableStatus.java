package cn.sky1998.mango.common.enums;

public enum EnableStatus {

    /**
     * 启用/成功/默认
     */
    Enable("enable", 1),

    /**
     * 不启用/失败/删除
     */
    DisEnable("disEnable",0);

    private final String aliasName;

    private final int aliasValue;

    EnableStatus(String aliasName, int aliasValue) {
        this.aliasName = aliasName;
        this.aliasValue = aliasValue;
    }


    public String aliasName() {
        return aliasName;
    }

    public Integer aliasValue() {
        return aliasValue;
    }


}
