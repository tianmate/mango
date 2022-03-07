package cn.sky1998.mongo;

import cn.sky1998.mongo.framework.config.MangoConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author tcy
 * @Date 20-12-2021
 */
@SpringBootTest
public class MangoConfigTest {

    @Autowired
    private MangoConfig mangoConfig;

    @Test
    public void test1(){
        System.out.println(mangoConfig.getName());
    }
}