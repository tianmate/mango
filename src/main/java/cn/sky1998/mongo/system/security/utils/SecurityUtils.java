package cn.sky1998.mongo.system.security.utils;

import cn.sky1998.mongo.common.enums.HttpStatus;
import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.security.entity.AccountUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 获取当前登录用户的信息
 * @author tcy@1753163342@qq.com
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

    /**
     * 判断密码是否相同
     *
     * @param rawPassword 真实密码
     * @param encodedPassword 加密后字符
     * @return 结果
     */
    public static boolean matchesPassword(String rawPassword, String encodedPassword)
    {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }

    /**
     * 生成BCryptPasswordEncoder密码
     *
     * @param password 密码
     * @return 加密字符串
     */
    public static String encryptPassword(String password)
    {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(password);
    }
}