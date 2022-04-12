package cn.sky1998.mongo.system.service.impl;

import cn.sky1998.mongo.common.exception.CustomException;
import cn.sky1998.mongo.framework.web.core.AjaxResult;
import cn.sky1998.mongo.system.domain.*;
import cn.sky1998.mongo.system.domain.dto.AccountRoleDto;
import cn.sky1998.mongo.system.domain.form.AccountForm;
import cn.sky1998.mongo.system.domain.form.AccountRoleForm;
import cn.sky1998.mongo.system.mapper.AccountMapper;
import cn.sky1998.mongo.system.mapper.RoleMapper;
import cn.sky1998.mongo.system.security.utils.SecurityUtils;
import cn.sky1998.mongo.system.service.AccountService;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.security.core.token.TokenService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author tcy@1753163342@qq.com
 * @Date 09-12-2021
 */
@Service
public class AccountServiceImpl implements AccountService  {

   @Autowired
   private AccountMapper mapper;


    @Override
    public int insert(Account account) {
        //密码加密
        account.setPassword(SecurityUtils.encryptPassword(account.getPassword()));
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
            account.setPassword(SecurityUtils.encryptPassword(account.getPassword()));
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
        AccountRoleDto userRole = mapper.getUserRole(accountRoleForm.getAccount());
        List<Role> collect=accountRoleForm.getRoles();

        for (Role role : userRole.getRoles()) {
            collect = collect.stream().filter(str -> !str.getId().equals(role.getId())).collect(Collectors.toList());
        }


        return collect;
    }

    @Override
    public AccountRoleDto getUserRole(Account account) {
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

    @Override
    public AccountRoleDto profile() {

        Long userId = SecurityUtils.getUserId();

        AccountRoleDto profile = mapper.profile(userId);

        //查询用户信息
        return profile;
    }

    /**
     * 重置密码
     * @return
     */
    @Override
    public AjaxResult updatePwd(String oldPassword, String newPassword) {

        Long userId = SecurityUtils.getUserId();

        String password = SecurityUtils.getLoginUser().getPassword();

        if (!SecurityUtils.matchesPassword(oldPassword, password))
        {
            throw new CustomException("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(newPassword, password))
        {
            throw new CustomException("新密码不能与旧密码相同");
        }
        Account account=new Account();
        account.setId(userId);
        account.setPassword(SecurityUtils.encryptPassword(newPassword));
        int i = mapper.updateByPrimaryKeySelective(account);
        if (i>0){
            // 更新缓存用户密码 TODO

            return AjaxResult.success();
        }
        throw new CustomException("修改密码异常，请联系管理员");
    }

}