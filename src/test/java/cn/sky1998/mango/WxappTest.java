package cn.sky1998.mango;

import cn.sky1998.mango.system.wxapp.WxappUtils;
import cn.sky1998.mango.system.wxapp.service.impl.WxappServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author tcy@1753163342@qq.com
 * @Date 15-12-2021
 */
@SpringBootTest
public class WxappTest {


    @Autowired
    private WxappUtils wxappUtils;

    @Autowired
    private WxappServiceImpl wxappService;

    @Test
    public void test1() {

        System.out.println(wxappUtils.sendKfMsg("@小李同学,希望你在新的一年里面快快乐乐的", "oZ2B35vrgE5AwaBdVXjsa1jtavzA"));

    }


    @Test
    public void test2(){
    }

}