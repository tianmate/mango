package cn.sky1998.mango;

import cn.sky1998.mango.framework.config.MangoConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author tcy@1753163342@qq.com
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