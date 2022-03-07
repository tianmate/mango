package cn.sky1998.mongo.system.service;


import cn.sky1998.mongo.system.domain.Account;

import java.util.Map;

/**
 * @author tcy
 * @Date 20-01-2022
 */
public interface LoginService {

    /**
     * 常规登录
     * @return
     */
    public Map<Object,Object> commonLogin(Account sysAccount);

    /**
     * 公众号登录
     * @param sysAccount
     * @return
     */
    public Map<String,Object> gzhLogin(Account sysAccount);

    /**
     * 小程序登录
     * @return
     */
    public Map<Object,Object> uniappLogin();
}

