package cn.sky1998.mango.framework.aspect.annotation;

import cn.sky1998.mango.common.constant.Constants;

import java.lang.annotation.*;

/**
 * 日志注解
 * @author tcy@1753163342@qq.com
 * @Date 27-06-2022
 */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AutoLog {

    /**
     * 日志内容
     *
     * @return
     */
    String value() default "";

    /**
     * 业务key字段（登录用户默认为登录用户名）
     * @return
     */
    String key() default "";
    /**
     * 日志类型
     *
     * @return 1:登录日志;2:操作日志;
     */
    int logType() default Constants.LOG_TYPE_2;

    /**
     * 操作日志类型
     *
     * @return （1增加，2删除，3修改，4查询）
     */
    int operateType() default 0;

}
