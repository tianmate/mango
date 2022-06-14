package cn.sky1998.mango.common.exception.enums;

/**
 * 枚举参数错误
 *
 * @author zzl
 */
public class EnumParameterException extends RuntimeException {
  private Integer code;

  private String message;

  public EnumParameterException(String msg) {
    this.message = msg;
  }


  @Override
  public String getMessage() {
    return message;
  }
}
