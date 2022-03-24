package cn.sky1998.mongo;

import cn.sky1998.mongo.framework.util.RedisUtils;
import cn.sky1998.mongo.framework.util.SpringUtils;
import cn.sky1998.mongo.system.mapper.AccountMapper;
import cn.sky1998.mongo.work.service.impl.ArticleServiceImpl;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.*;

import javax.annotation.Resource;


@SpringBootTest
class FlyarticleApplicationTests {

    private final Logger log = LoggerFactory.getLogger(FlyarticleApplicationTests.class);

    @Autowired
    private RedisTemplate  redisTemplate;
    @Resource
    private StringRedisTemplate redis;
   @Autowired
   private ArticleServiceImpl articleService;

   @Autowired
   private AccountMapper mapper;

    @Autowired
    private RedisUtils redisCache;
    @Test
    public void test1(){
        redisCache.setValue("test","value111111");
        Object test = redisCache.getValue("test");
        System.out.println(test);
        Object redisTemplate = SpringUtils.getBeanByName("redisTemplate");
        System.out.println(redisTemplate.toString());
    }
}
