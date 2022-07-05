package cn.sky1998.mango.system.security.handle;

import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.system.security.entity.AccountUserDetails;
import cn.sky1998.mango.system.security.utils.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Set;

/**
 * 鉴权模块
 * @author tcy@1753163342@qq.com
 * @Date 10-12-2021
 */
@Service("ss")
public class PermissionHandle {

    /** 所有权限标识 */
    private static final String ALL_PERMISSION = "*:*:*";

    /** 管理员角色权限标识 */
    private static final String SUPER_ADMIN = "admin";

    private static final String ROLE_DELIMETER = ",";

    private static final String PERMISSION_DELIMETER = ",";

    /**
     * 验证是否具有某权限
     * @return
     */
    public Boolean hasPermi(String permission){
      //  从用户token中获取用户角色鉴权

        if (StringUtils.isEmpty(permission))
        {
            return false;
        }
        AccountUserDetails loginUser = SecurityUtils.getLoginUser();
        if (StringUtils.isNull(loginUser) || CollectionUtils.isEmpty(loginUser.getPermissions()))
        {
            return false;
        }
        return hasPermissions(loginUser.getPermissions(), permission);


    }

    /**
     * 判断是否包含权限
     *
     * @param permissions 权限列表
     * @param permission 权限字符串
     * @return 用户是否具备某权限
     */
    private boolean hasPermissions(Set<String> permissions, String permission)
    {
        return permissions.contains(ALL_PERMISSION) || permissions.contains(StringUtils.trim(permission));
    }

}