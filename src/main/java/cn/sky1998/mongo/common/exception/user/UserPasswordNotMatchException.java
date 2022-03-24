package cn.sky1998.mongo.common.exception.user;

/**
 * 用户密码不正确或不符合规范异常类
 *
 * @author tcy
 */
public class UserPasswordNotMatchException extends UserException {
  private static final long serialVersionUID = 1L;

  public UserPasswordNotMatchException() {
    super("user.not.exists", null);
  }
}
