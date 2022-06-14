package cn.sky1998.mango.system.security.handle;

import cn.sky1998.mango.framework.util.ServletUtils;
import cn.sky1998.mango.common.enums.HttpStatus;
import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

import static cn.sky1998.mango.common.enums.HttpStatus.UNAUTHORIZED;

/**
 * 授权失败处理类 返回未授权
 *
 * @author tcy@1753163342@qq.com
 */
@Component
public class UnAuthenticationHandle implements AuthenticationEntryPoint, Serializable {
  private static final long serialVersionUID = -8970718410437077606L;

  @Override
  public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) {

    HttpStatus code = UNAUTHORIZED;
    String msg = StringUtils.format("请求访问：{}，认证失败，无法访问系统资源啦", request.getRequestURI());
    ServletUtils.renderString(response, AjaxResult.error(code, msg).toString());

  }

}
