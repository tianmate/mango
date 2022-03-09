package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.common.constant.Constants;
import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.common.utils.StringUtils;
import cn.sky1998.mongo.framework.springutils.RedisUtils;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.form.LoginBody;
import cn.sky1998.mongo.system.security.service.SecurityLoginService;
import cn.sky1998.mongo.system.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author tcy
 * @Date 20-01-2022
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private SecurityLoginService service;
    @Override
    public Map<Object, Object> commonLogin(LoginBody loginBody) {

        //校验验证码
        if (StringUtils.isEmpty(loginBody.getCode())&&StringUtils.isEmpty(loginBody.getUuid())){
            throw new CustomException("验证码不能为空");
        }
        String verifyKey = Constants.CAPTCHA_CODE_KEY + loginBody.getUuid();
        String value = (String) RedisUtils.getValue(verifyKey);
        if (!value.equals(loginBody.getCode())){
            throw new CustomException("验证码不正确");
        }

        return service.login(loginBody.getUsername(),loginBody.getPassword());
    }

    @Override
    public Map<String, Object> gzhLogin(Account sysAccount) {
        /**
         * 前端传递的code和后端生成的code进行比对
         */

        Map<String,Object> map=new HashMap<>(2);

        map.put("token","token");

        return map;
    }

    @Override
    public Map<Object, Object> uniappLogin() {
        return null;
    }
}