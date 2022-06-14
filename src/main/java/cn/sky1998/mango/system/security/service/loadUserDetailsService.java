package cn.sky1998.mango.system.security.service;

import cn.sky1998.mango.common.exception.CustomException;
import cn.sky1998.mango.system.domain.AccountRoleVo;
import cn.sky1998.mango.system.domain.Account;
import cn.sky1998.mango.system.domain.dto.AccountRoleDto;
import cn.sky1998.mango.system.mapper.AccountMapper;
import cn.sky1998.mango.system.security.entity.AccountUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

/**
 * 查询密码的dao层
 * @author tcy@1753163342@qq.com
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
        }else if (sysAccount.getEnable()==1){
            throw new CustomException("账户已经锁定，请联系管理员");
        }else if (sysAccount.getDel()==1){
            throw new CustomException("账户已经删除，请联系管理员");
        }
        //查询角色信息
        AccountRoleDto userRole = sysAccountMapper.getUserRole(sysAccount);
        userDetails.setId(sysAccount.getId());
        userDetails.setUsername(username);
        userDetails.setPassword(sysAccount.getPassword());
        userDetails.setSysRoles(userRole.getRoles());

        return userDetails;
    }

}