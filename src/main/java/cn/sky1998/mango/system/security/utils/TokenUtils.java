package cn.sky1998.mango.system.security.utils;

import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.framework.utils.RedisUtils;
import cn.sky1998.mango.system.security.entity.AccountUserDetails;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * token工具类
 * @author tcy@1753163342@qq.com
 * @Date 16-12-2021
 */
public class TokenUtils {

    /**
     * 超时时间
     */
    private static final long EXPIRITION=1000 * 24 * 60 * 60 * 7;
    /**
     * 请求头
     */
    public static final String TOKEN_HEADER = "Authorization";
    /**
     * 密钥
     */
    public static final String APPSECRET_KEY="thisisappsercretkey";

    /**
     * 创建token
     * @param username
     * @return
     */
    public static String createToken(String username){
        String token= Jwts
                .builder()
                .setSubject(username)
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRITION))
                .claim("name",username)
                .signWith(SignatureAlgorithm.HS256,APPSECRET_KEY).compact();
        return token;
    }

    /**
     * 解析token获取用户名
     * @param token
     * @return
     */
    public static String parserToken(String token){
        Claims body = Jwts.parser().setSigningKey(APPSECRET_KEY)
                .parseClaimsJws(token).getBody();
        return body.get("name").toString();
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    public static AccountUserDetails getLoginUser(HttpServletRequest request) {
        // 获取请求携带的令牌
        String token = request.getHeader(TOKEN_HEADER);
        if (StringUtils.isNotEmpty(token)) {
            String s = parserToken(token);

            AccountUserDetails value = (AccountUserDetails)RedisUtils.getValue(s);


            return value;
        }
        return null;
    }


}