package cn.sky1998.mango.common.exception.file;

import cn.sky1998.mango.common.exception.BaseException;

/**
 * 文件信息异常类
 *
 * @author tcy@1753163342@qq.com
 */
public class FileException extends BaseException {
  private static final long serialVersionUID = 1L;

  public FileException(String code, Object[] args) {
    super("file", code, args, null);
  }

}
