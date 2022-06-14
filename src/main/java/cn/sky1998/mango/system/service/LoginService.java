package cn.sky1998.mango.system.service;


import cn.sky1998.mango.system.domain.Account;
import cn.sky1998.mango.system.domain.form.LoginBody;

import java.util.Map;

/**
 * @author tcy@1753163342@qq.com
 * @Date 20-01-2022
 */
public interface LoginService {

    /**
     * 常规登录
     * @return
     */
    public Map<Object,Object> commonLogin(LoginBody loginBody);

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

