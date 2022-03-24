package cn.sky1998.mongo.framework.web.interceptor;


import com.fasterxml.jackson.databind.ObjectMapper;
import cn.sky1998.mongo.common.constant.Constants;
import cn.sky1998.mongo.common.utils.StringUtils;
import cn.sky1998.mongo.framework.util.HttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * @author tcy
 * @Date 14-12-2021
 */
@Component
@Order(10000)
public class RequestPrintInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ObjectMapper objectMapper;

    private final Logger log= LoggerFactory.getLogger(RequestPrintInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String contentType = request.getContentType() + "";

        log.info("===============请求开始====================");
        log.info("地址为："+request.getLocalAddr());
        log.info("请求方式为："+request.getMethod());
        log.info("请求全路径："+request.getRequestURL().toString());
        if (contentType.contains(Constants.CONTENT_TYPE_JSON)){
          log.info("请求参数"+ StringUtils.replaceBlank(HttpUtils.getBodyString(request)));
        }else {
            log.info("请求参数"+ objectMapper.writeValueAsString(request.getParameterMap()));
        }
        log.info("请求时间为："+objectMapper.writeValueAsString(new Date()));
        log.info("===============请求结束==================");
        return true;
    }



    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

       // HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}