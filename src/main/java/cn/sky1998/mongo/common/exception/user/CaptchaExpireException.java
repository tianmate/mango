package cn.sky1998.mongo.common.exception.user;

/**
 * 验证码失效异常类
 *
 * @author tcy@1753163342@qq.com
 */
public class CaptchaExpireException extends UserException {
  private static final long serialVersionUID = 1L;

  public CaptchaExpireException() {
    super("user.jcaptcha.expire", null);
  }
}
