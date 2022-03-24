package cn.sky1998.mongo.common.exception.file;

import cn.sky1998.mongo.common.exception.BaseException;

/**
 * 文件信息异常类
 *
 * @author tcy
 */
public class FileException extends BaseException {
  private static final long serialVersionUID = 1L;

  public FileException(String code, Object[] args) {
    super("file", code, args, null);
  }

}
