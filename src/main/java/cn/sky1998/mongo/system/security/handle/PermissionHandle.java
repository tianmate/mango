package cn.sky1998.mongo.system.security.handle;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * 鉴权模块
 * @author tcy@1753163342@qq.com
 * @Date 10-12-2021
 */
@Service("ps")
public class PermissionHandle {

    /**
     * 验证是否具有某权限
     * @return
     */
    public Boolean hasPermi(String permission){
        //从用户token中获取用户角色鉴权
//        HttpServletRequest request = ServletUtils.getRequest();
//        Enumeration<String> authorization = request.getHeaders("Authorization");
//        System.out.println(authorization);
//        return true;
        return null;
    }
}