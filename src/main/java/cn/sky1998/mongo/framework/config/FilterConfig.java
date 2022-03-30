package cn.sky1998.mongo.framework.config;

import cn.sky1998.mongo.framework.web.filter.RepeateFilter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * springmvc过滤器配置
 * @author tcy@1753163342@qq.com
 * @Date 15-12-2021
 */
@Configuration
//@ConditionalOnProperty(prefix = "spring",name = "profiles.active",havingValue = "dev")
public class FilterConfig {


    /**
     * 重复读取request的filter
     * Filter注册
     */
    @Bean
    public FilterRegistrationBean RepeateRequestFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new RepeateFilter());
        registration.addUrlPatterns("/*");
        registration.setName("repeatableFilter");
        registration.setOrder(FilterRegistrationBean.LOWEST_PRECEDENCE);
        return registration;
    }
}