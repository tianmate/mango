package cn.sky1998.mongo.framework.config;

import cn.sky1998.mongo.framework.web.interceptor.RequestPrintInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author tcy
 * @Date 14-12-2021
 */
@Configuration
@Order(0)
//根据环境配置是否添加打印过滤器
//@ConditionalOnProperty(prefix = "spring",name = "profiles.active",havingValue = "dev")
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private RequestPrintInterceptor requestPrintInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(requestPrintInterceptor);
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**").allowedOriginPatterns("*")
                .allowedMethods("GET", "HEAD", "POST","PUT", "DELETE", "OPTIONS")
                .allowCredentials(true).maxAge(3600);
    }

}