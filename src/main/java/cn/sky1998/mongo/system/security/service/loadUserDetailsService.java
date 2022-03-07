package cn.sky1998.mongo.system.security.service;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.domain.AccountRoleVo;
import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.mapper.AccountMapper;
import cn.sky1998.mongo.system.security.entity.AccountUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

/**
 * 查询密码的dao层
 * @author tcy
 * @Date 08-12-2021
 */
@Component
public class loadUserDetailsService implements UserDetailsService {

    @Autowired
    private AccountMapper sysAccountMapper;

    @Override
    public AccountUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        AccountUserDetails userDetails=new AccountUserDetails();

        //查询用户信息
        Account sysAccount = sysAccountMapper.selectByUsername(username);
        if (Objects.isNull(sysAccount)){
            throw new CustomException("用户不存在");
        }
        //查询角色信息
        List<AccountRoleVo> userRoles = sysAccountMapper.getUserRole(sysAccount);
        userDetails.setId(sysAccount.getId());
        userDetails.setUsername(username);
        userDetails.setPassword(sysAccount.getPassword());
        userDetails.setSysRoles(userRoles);

        return userDetails;
    }

}