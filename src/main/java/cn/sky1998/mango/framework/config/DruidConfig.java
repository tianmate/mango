package cn.sky1998.mango.framework.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Servlet;
import javax.sql.DataSource;

/**
 * @author tcy@1753163342@qq.com
 * @Date 20-12-2021
 */
//@Configuration
public class DruidConfig {

    //@Bean
    //// 将所有前缀为spring.datasource下的配置项都加载DataSource中
    //@ConfigurationProperties(prefix = "spring.datasource")
    //public DataSource druidDataSource() {
    //    return new DruidDataSource();
    //}

   // @Bean
    public ServletRegistrationBean<Servlet> druidServlet() {
        // 进行 druid 监控的配置处理
        ServletRegistrationBean<Servlet> srb = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/**");
        // 白名单
       // srb.addInitParameter("allow", "127.0.0.1");
        // 黑名单
      //  srb.addInitParameter("deny", "192.168.31.253");
        // 用户名
        srb.addInitParameter("loginUsername", "root");
        // 密码
        srb.addInitParameter("loginPassword", "root");
        // 是否可以重置数据源
        srb.addInitParameter("resetEnable", "false");
        return srb;
    }

}