package cn.sky1998.mongo.common.enums;

/**
 * 用户类型
 */
public enum UserType {

    Admin(100),
    Runer(101),
    RegisterUser(102),
    CommonUser(103);

   private Integer value;

    UserType(Integer value) {
        this.value = value;
    }

}
