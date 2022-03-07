package cn.sky1998.mongo.framework.springutils;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.stereotype.Component;

/**
 * spirng相关操作类
 * @author tcy
 * @Date 13-12-2021
 */
@Component
public class SpringUtils implements BeanFactoryPostProcessor {

    private static DefaultListableBeanFactory beanFactory=new DefaultListableBeanFactory();

    /**
     * 从容器中获取bean
     * @param beanName
     * @return
     */

    public static Object getBeanByName(String beanName){
        return beanFactory.getBean(beanName);
    }

    public static Object getBeanByName(Class clazz){
        return beanFactory.getBean(clazz);
    }

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        SpringUtils.beanFactory.setParentBeanFactory(beanFactory);
    }
}