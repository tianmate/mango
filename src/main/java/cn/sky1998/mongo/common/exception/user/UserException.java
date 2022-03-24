package cn.sky1998.mongo.common.exception.user;

import cn.sky1998.mongo.common.exception.BaseException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * 用户信息异常类
 *
 * @author tcy
 */
public class UserException extends BaseException {
  private static final long serialVersionUID = 1L;

  public UserException(String code, Object[] args) {
    super("user", code, args, null);
  }

}
