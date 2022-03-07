package cn.sky1998.mongo.common.enums;

import cn.sky1998.mongo.common.exception.enums.EnumParameterException;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * 是否枚举
 *
 * @author ljl
 */
public enum YesOrNoEnum {

  /**
   * true, 是, 启用, 上架
   */
  YES(0),
  /**
   * false, 否, 禁用, 下架
   */
  NO(1);

  private Integer value;

  YesOrNoEnum(Integer value) {
    this.value = value;
  }

  @JsonValue
  public Integer getValue() {
    return value;
  }

  @JsonCreator
  public static YesOrNoEnum create(String name) {
    try {
      return YesOrNoEnum.valueOf(name);
    } catch (IllegalArgumentException e) {
      int code = Integer.parseInt(name);
      for (YesOrNoEnum value : YesOrNoEnum.values()) {
        if (value.value == code) {
          return value;
        }
      }
    }
    throw new EnumParameterException("No element matches " + name);
  }


  public static YesOrNoEnum getByValue(Integer value) {

    if (value == null) {
      return null;
    }
    for (YesOrNoEnum e : YesOrNoEnum.values()) {
      if (value.equals(e.value)) {
        return e;
      }
    }
    return null;
  }
}
