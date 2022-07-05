package cn.sky1998.mango.system.wxapp;

import cn.sky1998.mango.common.exception.CustomException;
import cn.sky1998.mango.common.utils.StringUtils;
import cn.sky1998.mango.framework.utils.SpringUtils;
import cn.sky1998.mango.system.wxapp.domain.BaseContent;
import cn.sky1998.mango.system.wxapp.domain.ContentMsg;
import cn.sky1998.mango.system.wxapp.domain.KfContentMsg;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Map;

@Service
public class WxappUtils {

        @Value("${mango.wxapp.gzh.appid}")
        private  String appid;
        @Value("${mango.wxapp.gzh.secret}")
        private  String secret;


    private static RestTemplate restTemplate= (RestTemplate) SpringUtils.getBeanByName("restTemplate");

    @Autowired
    private ObjectMapper objectMapper;
    /**
         * 根据微信APPID和secret获取Access_token
         * @return
         */
        public String getAccessToken(){

            String url = String.format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s",appid,secret);
            ResponseEntity<String> result = restTemplate.getForEntity(url, String.class);

            if(result.getStatusCode()== HttpStatus.OK){
                Map map;
                try {
                    map = objectMapper.readValue(result.getBody(), Map.class);

                } catch (JsonProcessingException e) {
                    //异常存档
                    throw new CustomException("获取微信公众号access_token异常");
                }
                String access_token = map.get("access_token").toString();
                String expires_in = map.get("expires_in").toString();
                //存入redis缓存

                return access_token;
            }
            return null;
        }


        /**
         * 用SHA1算法验证Token
         * @param token
         * @param timestamp
         * @param nonce
         * @return
         */
        public String getSHA1(String token, String timestamp, String nonce){

            String[] arr = new String[] { token, timestamp, nonce };
            Arrays.sort(arr);

            StringBuilder content = new StringBuilder();
            for (int i = 0; i < arr.length; i++) {
                content.append(arr[i]);
            }
            MessageDigest md = null;
            String tmpStr = null;
            try {
                md = MessageDigest.getInstance("SHA-1");
                // 将三个参数字符串拼接成一个字符串进行sha1加密
                byte[] digest = md.digest(content.toString().getBytes());
                tmpStr = byteToStr(digest);
            } catch (NoSuchAlgorithmException e) {

            }

            return tmpStr;
        }

        /**
         * @Description 将字节数组转换为十六进制字符串
         * @author lst
         * @date 2020-8-18 11:56
         * @param byteArray
         * @return java.lang.String
         */
        private String byteToStr(byte[] byteArray) {
            StringBuilder strDigest = new StringBuilder();
            for (int i = 0; i < byteArray.length; i++) {
                strDigest.append(byteToHexStr(byteArray[i]));
            }
            return strDigest.toString();
        }
        /**
         * @Description  将字节转换为十六进制字符串
         * @author lst
         * @date 2020-8-18 11:57
         * @param mByte
         * @return java.lang.String
         */
        private String byteToHexStr(byte mByte) {
            char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
                    'B', 'C', 'D', 'E', 'F' };
            char[] tempArr = new char[2];
            tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
            tempArr[1] = Digit[mByte & 0X0F];
            String s = new String(tempArr);
            return s;
        }


    /**
     * 解析收到的消息
     * @param message
     * @return
     */
    public ContentMsg receiveContentMsg(String message){
        ContentMsg contentMsg = new ContentMsg();
        // 遍历类
        for (Class clazz = contentMsg.getClass();!clazz.equals(Object.class);clazz=clazz.getSuperclass()){
            Field fields[] = clazz.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String column = field.getName();
                //获取属性值
                String colunmValue = XmlUtils.getColunmValue(message, column.toUpperCase().substring(0, 1) + column.substring(1));
                if (StringUtils.isNotEmpty(colunmValue)) {
                    try {
                        Method method = clazz.getDeclaredMethod("set" + column.toUpperCase().substring(0, 1) + column.substring(1), String.class);
                        method.invoke(contentMsg, colunmValue);
                    } catch (NoSuchMethodException e) {
                        e.printStackTrace();
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        System.out.println(contentMsg.getContent());
        return contentMsg;
    }

    //public PublicUser getUserInfo(String openid){
    //    PublicUser publicUser=new PublicUser();
    //    Map map = restTemplate.getForObject("https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + getAccessToken() + "&openid=" + openid + "&lang=zh_CN", Map.class);
    //    publicUser.setOpenid(openid);
    //    publicUser.setSubscribe((Integer) map.get("subscribe"));
    //    publicUser.setSex((Integer) map.get("sex"));
    //    publicUser.setSubscribeTime(DateUtils.stampToDate((Integer) map.get("subscribe_time")));
    //    publicUser.setSubscribeScene((String) map.get("subscribe_scene"));
    //    return publicUser;
    //}

    public ResponseEntity<String> sendKfMsg(String msg,String openid){

        KfContentMsg kfContentMsg=new KfContentMsg();
        BaseContent baseContent=new BaseContent();
        baseContent.setContent(msg);
        kfContentMsg.setMsgtype("text");
        kfContentMsg.setTouser(openid);
        kfContentMsg.setText(baseContent);
        String s = null;
        try {
             s = objectMapper.writeValueAsString(kfContentMsg);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        //设置请求头
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", "*/*");
        headers.add("Content-Type", "application/json");
        headers.add("Content-Encoding", "utf-8");


        HttpEntity<String> request = new HttpEntity<>(s,headers);

        ResponseEntity<String> stringResponseEntity = restTemplate.postForEntity("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+getAccessToken(), request, String.class);


        return stringResponseEntity;
    }
}
