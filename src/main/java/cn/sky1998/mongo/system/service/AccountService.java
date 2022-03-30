package cn.sky1998.mongo.system.service;


import cn.sky1998.mongo.system.domain.Account;
import cn.sky1998.mongo.system.domain.AccountRoleMenuVo;
import cn.sky1998.mongo.system.domain.AccountRoleVo;
import cn.sky1998.mongo.system.domain.Menu;
import cn.sky1998.mongo.system.domain.form.AccountForm;
import cn.sky1998.mongo.system.domain.form.AccountRoleForm;

import java.util.List;


/**
 * @author tcy@1753163342@qq.com
 * @Date 09-12-2021
 */
public interface AccountService {

    public int insert(Account account);

    public List<Account> getList(AccountForm account);

    public int update(Account account);

    public int remove(Account account);

    public int assignRole(AccountRoleForm accountRole);

    public List<AccountRoleVo> getUserRole(Account account);

    public int removeUserRole(AccountRoleVo accountRoleVo);

    public List<Menu> getUserMenu(Account account);

    public Account profile();
}