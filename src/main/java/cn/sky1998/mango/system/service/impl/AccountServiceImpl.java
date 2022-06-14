package cn.sky1998.mango.system.service.impl;

import cn.sky1998.mango.common.exception.CustomException;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import cn.sky1998.mango.system.domain.*;
import cn.sky1998.mango.system.domain.dto.AccountRoleDto;
import cn.sky1998.mango.system.domain.form.AccountForm;
import cn.sky1998.mango.system.domain.form.AccountRoleForm;
import cn.sky1998.mango.system.mapper.AccountMapper;
import cn.sky1998.mango.system.mapper.RoleMapper;
import cn.sky1998.mango.system.security.utils.SecurityUtils;
import cn.sky1998.mango.system.service.AccountService;
import cn.sky1998.mango.system.service.IMenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.security.core.token.TokenService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
   private AccountMapper accountMapper;


    @Autowired
    private IMenuService menuService;

    @Override
    public int insert(Account account) {
        //密码加密
        account.setPassword(SecurityUtils.encryptPassword(account.getPassword()));
        //用户名校验不能有重复的
        Account accountSame = accountMapper.selectByUsername(account.getUsername());
        if (!Objects.isNull(accountSame)){
            throw new CustomException("用户名重复");
        }
        return accountMapper.insertSelective(account);
    }

    @Override
    public List<Account> getList(AccountForm account) {
        return accountMapper.getList(account);
    }

    @Override
    public int update(Account account) {
        if (account.getPassword()!=null){
            account.setPassword(SecurityUtils.encryptPassword(account.getPassword()));
        }
        if (SecurityUtils.getUserId()==account.getId()){
            account.setPassword(null);
        }
        return accountMapper.updateByPrimaryKeySelective(account);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateUserRole(AccountRoleDto accountRoleDto) {
        //更新用户信息
        Account account=new Account();
        BeanUtils.copyProperties(accountRoleDto,account);
        accountMapper.updateByPrimaryKeySelective(account);

        //更新用户角色
        for (Role role : accountRoleDto.getRoles()) {
            accountMapper.removeUserRole(accountRoleDto.getId(),role.getId());
        }
        if (accountRoleDto.getRoles().size()!=0){
        accountMapper.assignRole(accountRoleDto.getRoles(),accountRoleDto.getId());
        }
        return 1;
    }

    @Override
    public int remove(Account account) {
        account.setDel((byte) 1);
        return accountMapper.updateByPrimaryKeySelective(account);
    }


    @Override
    public int assignRole(AccountRoleForm accountRole) {
        //过滤重复的角色
        List<Role> roles=filterRepeatRole(accountRole);

        return accountMapper.assignRole(roles,accountRole.getAccount().getId());
    }

    private List<Role> filterRepeatRole(AccountRoleForm accountRoleForm) {
        AccountRoleDto userRole = accountMapper.getUserRole(accountRoleForm.getAccount());
        List<Role> collect=accountRoleForm.getRoles();

        for (Role role : userRole.getRoles()) {
            collect = collect.stream().filter(str -> !str.getId().equals(role.getId())).collect(Collectors.toList());
        }


        return collect;
    }

    @Override
    public AccountRoleDto getUserRole(Account account) {
        return accountMapper.getUserRole(account);
    }

    /**
     * 删除用户角色
     * @param
     * @return
     */
    //@Override
    //public int removeUserRole(AccountRoleVo accountRoleVo) {
    //    return accountMaper.removeUserRoles(accountRoleVo);
    //}

    @Override
    public List<Menu> getUserMenu(Account account) {

        return menuService.tree(account.getId());

    }

    @Override
    public AccountRoleDto profile() {

        Long userId = SecurityUtils.getUserId();

        AccountRoleDto profile = accountMapper.profile(userId);

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
        int i = accountMapper.updateByPrimaryKeySelective(account);
        if (i>0){
            // 更新缓存用户密码 TODO

            return AjaxResult.success();
        }
        throw new CustomException("修改密码异常，请联系管理员");
    }

}