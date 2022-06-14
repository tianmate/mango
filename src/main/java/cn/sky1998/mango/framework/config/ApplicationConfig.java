package cn.sky1998.mango.framework.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author tcy@1753163342@qq.com
 * @Date 08-12-2021
 */
@Configuration
//这里配置本模块所需扫描的包路径
@ComponentScan(basePackages = {
        "cn.sky1998.mango.**"
})
@MapperScan("cn.sky1998.mango.**.mapper")
public class ApplicationConfig {

}