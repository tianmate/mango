package cn.sky1998.mongo.system.security.utils;

import cn.sky1998.mongo.common.enums.HttpStatus;
import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.security.entity.AccountUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 获取当前登录用户的信息
 * @author tcy
 * @Date 16-12-2021
 */
public class SecurityUtils {

    /**
     * 获取Authentication
     */
    public static Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }


    /**
     * 获取用户
     **/
    public static AccountUserDetails getLoginUser()
    {
        try
        {
            return (AccountUserDetails) getAuthentication().getPrincipal();
        }
        catch (Exception e)
        {
            throw new CustomException("获取用户信息异常");
        }
    }
    /**
     * 获取用户id
     **/
    public static Long getUserId()
    {
        try
        {
            return getLoginUser().getId();
        }
        catch (Exception e)
        {
            throw new CustomException("获取用户账户异常");
        }
    }
}