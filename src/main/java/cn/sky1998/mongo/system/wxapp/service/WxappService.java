package cn.sky1998.mongo.system.wxapp.service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 微信公众号登录业务
 */
public interface WxappService {


    /**
     * 公众号-获取二维码
     * @return
     */
    public Map<String,Object> getQrCode();

    /**
     * 公众号-检查用户登录状态
     * @param ticket
     * @return
     */
    public String checkLogin(String ticket);

    /**
     * 微信相关回调
     * @param request
     * @return
     */
    public String handleWxEvent(HttpServletRequest request) throws IOException;

    /**
     * 验证微信回调token验证
     * @param signature
     * @param timestamp
     * @param nonce
     * @param echostr
     * @return
     */
    public String validateWxappToken(String signature, String timestamp, String nonce, String echostr);

    public String getMessage(HttpServletRequest request,String openid);


}
