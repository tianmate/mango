package cn.sky1998.mongo.framework.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author tcy
 * @Date 08-12-2021
 */
@Configuration
//这里配置本模块所需扫描的包路径
@ComponentScan(basePackages = {
        "cn.sky1998.mongo.**"
})
@MapperScan("cn.sky1998.mongo.**.mapper")
public class ApplicationConfig {

}