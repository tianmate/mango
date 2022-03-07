package cn.sky1998.mongo.system.security.service;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.common.exception.user.UserPasswordNotMatchException;
import cn.sky1998.mongo.framework.springutils.RedisUtils;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.mapper.AccountMapper;
import cn.sky1998.mongo.system.security.utils.TokenUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author tcy
 * @Date 10-12-2021
 */
@Service
public class SecurityLoginService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private AccountMapper accountMapper;
    /**
     * 常规登录
     * @param username
     * @param password
     * @return
     */
    public  Map<Object,Object> login(String username, String password) {

        //用户验证
        final Authentication authentication = authenticate(username, password);

        //存储认证信息
        SecurityContextHolder.getContext().setAuthentication(authentication);
        //生成token
        String token = TokenUtils.createToken(username);
        //保存到redis
        RedisUtils.setValue(username,authentication.getPrincipal(),3600*24*30);
        Account account = accountMapper.selectByUsername(username);
        Map<Object,Object> map=new HashMap<>(2);
        map.put("token",token);
        map.put("userInfo",account);

        return map;
    }


    private Authentication authenticate(String username, String password) {
        Authentication authenticate = null;
        try {
            //比对密码
            UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            authenticate = authenticationManager.authenticate(usernamePasswordAuthenticationToken);

            //该方法会去调用userDetailsService.loadUserByUsername()去验证用户名和密码，如果正确，则存储该用户名密码到“security 的context中

        } catch (DisabledException | BadCredentialsException e) {

            throw new UserPasswordNotMatchException();

        }
        return authenticate;
    }



}