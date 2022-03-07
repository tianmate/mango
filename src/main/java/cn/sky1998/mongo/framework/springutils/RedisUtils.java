package cn.sky1998.mongo.framework.springutils;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * redis操作的相关工具类
 * @author tcy
 * @Date 13-12-2021
 */
@Component
public class RedisUtils {

    /**
     *     通过手动方式获取redistemplate-bean
     */
    public static RedisTemplate redisTemplate= (RedisTemplate) SpringUtils.getBeanByName("redisTemplate");

    /**
     * key-value\hash\list\set\zset
     * https://docs.spring.io/spring-data/redis/docs/current/api/org/springframework/data/redis/core/RedisTemplate.html官方文档api
     */

    //key-value

    /**
     * 获取key-value
     * @param key
     * @return
     */
    public static Object getValue(String key){
       return redisTemplate.opsForValue().get(key);
    }

    /**
     * 存key-value
     * @param key
     * @param value
     * @param <T>
     */
    public static <T> void setValue(String key,T value){
        redisTemplate.opsForValue().set(key,value);
    }

    /**
     * 设置超时时间
     * @param key
     * @param value
     * @param timeout
     */
    public static <T> void setValue(String key,final T value, Integer timeout){
        redisTemplate.opsForValue().set(key,value,timeout,TimeUnit.SECONDS);
    }

    /**
     * 设置超时时间，自定义时间单位
     * @param key
     * @param value
     * @param timeout
     * @param timeUnit
     * @param <T>
     */
    public static <T> void setValue(String key, T value, Integer timeout,TimeUnit timeUnit){
        redisTemplate.opsForValue().set(key,value,timeout,timeUnit);
    }

    /**
     * 查询redis是否存在该key
     * @param key
     * @return
     */
    public static <K> boolean hasKey(K key){
       return redisTemplate.hasKey(key);
    }

    /**
     * 清空redis
     * @param <K>
     * @return
     */
    public static <K> boolean empty(){
        Set keys = redisTemplate.keys("*");
        if (keys.size()!=0) {
            // 清空
            redisTemplate.delete(keys);
        }
        return true;
    }

}