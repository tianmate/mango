package cn.sky1998.mango.system.wxapp.service.impl;

import cn.sky1998.mango.common.exception.CustomException;
import cn.sky1998.mango.framework.config.MangoConfig;
import cn.sky1998.mango.framework.utils.SpringUtils;
import cn.sky1998.mango.system.wxapp.WxappUtils;
import cn.sky1998.mango.system.wxapp.domain.ContentMsg;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import cn.sky1998.mango.system.wxapp.service.WxappService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

/**
 * 微信公众号相关接口
 *
 * @author tcy@1753163342@qq.com
 * @Date 15-12-2021
 */
@Service
public class WxappServiceImpl implements WxappService {

    @Value("${mango.wxapp.gzh.token}")
    private static String token;

    private Logger log = LoggerFactory.getLogger(WxappServiceImpl.class);

    private static RestTemplate restTemplate = (RestTemplate) SpringUtils.getBeanByName("restTemplate");

    //公众号登录二维码
    private String qrCodeUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=%s";

    private static final String AUTHORIZATION_CODE = "authorization_code";

    //获取微信openid的接口
    private static final String REQUEST_URL = "https://api.weixin.qq.com/sns/jscode2session";

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private WxappUtils wxappUtils;

    @Autowired
    private MangoConfig mangoConfig;
    /**
     * 获取登录二维码
     *
     * @return
     */
    @Override
    public Map<String, Object> getQrCode() {
        ///获取临时二维码
        String url = String.format(qrCodeUrl, wxappUtils.getAccessToken());
        ResponseEntity<String> result = restTemplate.postForEntity(url, "{\"expire_seconds\": 604800, \"action_name\": \"QR_STR_SCENE\", \"action_info\": {\"scene\": {\"scene_str\": \"test\"}}}", String.class);
        log.info("二维码:{}", result.getBody());
        JsonNode jsonNode;
        try {
            jsonNode = objectMapper.readTree(result.getBody());
        } catch (JsonProcessingException e) {
            throw new CustomException("获取二维码异常");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("ticket", jsonNode.get("ticket"));
        map.put("url", jsonNode.get("url"));
        return map;

    }

    /**
     * 检查是否登录
     *
     * @param ticket
     * @return
     */
    @Override
    public String checkLogin(String ticket) {
        return null;
    }

    /**
     * 微信回调
     *
     * @param request
     * @return
     */
    @Override
    public String handleWxEvent(HttpServletRequest request) throws IOException {
        //字符输入流
        ServletInputStream inputStream = request.getInputStream();
        //转换成字符输出流
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
        bufferedReader.readLine();
        return null;
    }

    /**
     * 验证微信token
     *
     * @param signature
     * @param timestamp
     * @param nonce
     * @param echostr
     * @return
     */
    @Override
    public String validateWxappToken(String signature, String timestamp, String nonce, String echostr) {

//        String tmpStr = wxappUtils.getSHA1(token,  timestamp,  nonce);
//        System.out.println(tmpStr+"*****************");
//        if (tmpStr.equals(signature.toUpperCase())) {
//            return echostr;
//        }
        System.out.println(echostr);
        return echostr;
    }

    @Override
    public String getMessage(HttpServletRequest request, String openid) {
         System.out.println(wxappUtils.getAccessToken());

        //用来接收微信下发的xml信息
        BufferedReader bufferedReader = null;
        StringBuffer stringBuffer = null;
        String str;
        try {
            bufferedReader = request.getReader();
            stringBuffer = new StringBuffer();
            while ((str = bufferedReader.readLine()) != null) {
                stringBuffer.append(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        //用户信息（xml）
        String msg = stringBuffer.toString();

        ContentMsg contentMsg = wxappUtils.receiveContentMsg(msg);


        return contentMsg.getContent();

    }

    @Override
    public Map<String, Object> getOpenid(String code, String appid) {
        Map<String, Object> userMap = new HashMap<>();
        //secret 如果是单小程序，appid可以直接配置文件配置
        // 如果是多小程序，保存到小程序信息中。
        String secret=mangoConfig.getWxappUniappSecret();
        JSONObject sessionKeyOpenId = getSessionKeyOrOpenId(code,appid,secret);

        // 获取openId
        String openId = sessionKeyOpenId.getString("openid");
        userMap.put("openId",openId);

        return userMap;
    }

    @Override
    public Map<String, Object> getOpenid(String code, String appid,String secret) {
        Map<String, Object> userMap = new HashMap<>();

        JSONObject sessionKeyOpenId = getSessionKeyOrOpenId(code,appid,secret);

        // 获取openId
        String openId = sessionKeyOpenId.getString("openid");
        userMap.put("openId",openId);

        return userMap;
    }

    /**
     * 根据code获取openid
     * @param code
     * @return
     * @throws Exception
     */
    private JSONObject getSessionKeyOrOpenId(String code, String appid, String secret) {
        Map<String, String> requestUrlParam = new HashMap<>();
        // 小程序appId，自己补充
        requestUrlParam.put("appid", appid);
        // 小程序secret，自己补充
        requestUrlParam.put("secret", secret);
        // 小程序端返回的code
        requestUrlParam.put("js_code", code);
        // 默认参数
        requestUrlParam.put("grant_type", AUTHORIZATION_CODE);

        // 发送post请求读取调用微信接口获取openid用户唯一标识
        ResponseEntity<String> result = restTemplate.postForEntity(REQUEST_URL, requestUrlParam,String.class);
        return JSON.parseObject(result.getBody());
    }
}