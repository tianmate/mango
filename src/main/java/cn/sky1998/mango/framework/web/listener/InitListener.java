package cn.sky1998.mango.framework.web.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author tcy@1753163342@qq.com
 * @Date 20-12-2021
 */
//@Component
public class InitListener implements ServletContextListener{

    Logger log= LoggerFactory.getLogger(InitListener.class);


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.debug("初始化");
    }
}