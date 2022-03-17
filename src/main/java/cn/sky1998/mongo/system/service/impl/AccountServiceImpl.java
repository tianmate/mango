package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.system.domain.*;
import cn.sky1998.mongo.system.domain.form.AccountForm;
import cn.sky1998.mongo.system.domain.form.AccountRoleForm;
import cn.sky1998.mongo.system.mapper.AccountMapper;
import cn.sky1998.mongo.system.mapper.RoleMapper;
import cn.sky1998.mongo.system.service.AccountService;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author tcy
 * @Date 09-12-2021
 */
@Service
public class AccountServiceImpl implements AccountService  {

   @Autowired
   private AccountMapper mapper;

   @Autowired
   private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public int insert(Account account) {
        //密码加密
        account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
        //用户名校验不能有重复的
        Account accountSame = mapper.selectByUsername(account.getUsername());
        if (!Objects.isNull(accountSame)){
            throw new CustomException("用户名重复");
        }
        return mapper.insertSelective(account);
    }

    @Override
    public List<Account> getList(AccountForm account) {
        return mapper.getList(account);
    }

    @Override
    public int update(Account account) {
        if (account.getPassword()!=null){
            account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
        }
        return mapper.updateByPrimaryKeySelective(account);
    }

    @Override
    public int remove(Account account) {
        account.setDel((byte) 1);
        return mapper.updateByPrimaryKeySelective(account);
    }


    @Override
    public int assignRole(AccountRoleForm accountRole) {
        //过滤重复的角色
        List<Role> roles=filterRepeatRole(accountRole);

        return mapper.assignRole(roles,accountRole.getAccount().getId());
    }

    private List<Role> filterRepeatRole(AccountRoleForm accountRoleForm) {
        List<AccountRoleVo> userRole = mapper.getUserRole(accountRoleForm.getAccount());
        List<Role> collect=accountRoleForm.getRoles();

        for (AccountRoleVo accountRoleVo : userRole) {

            collect = collect.stream().filter(str -> !str.getId().equals(accountRoleVo.getRole().getId())).collect(Collectors.toList());
        }

        return collect;
    }

    @Override
    public List<AccountRoleVo> getUserRole(Account account) {
        return mapper.getUserRole(account);
    }

    @Override
    public int removeUserRole(AccountRoleVo accountRoleVo) {
        return mapper.removeUserRole(accountRoleVo);
    }

    @Override
    public List<Menu> getUserMenu(Account account) {
        return mapper.getUserMenu(account);
    }


}