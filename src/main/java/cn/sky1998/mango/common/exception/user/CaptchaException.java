package cn.sky1998.mango.common.exception.user;

/**
 * 验证码错误异常类
 *
 * @author tcy@1753163342@qq.com
 */
public class CaptchaException extends UserException {
  private static final long serialVersionUID = 1L;

  public CaptchaException() {
    super("user.jcaptcha.error", null);
  }
}