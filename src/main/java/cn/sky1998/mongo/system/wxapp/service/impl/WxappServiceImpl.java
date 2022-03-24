package cn.sky1998.mongo.system.wxapp.service.impl;

import cn.sky1998.mongo.common.utils.TelUtils;
import cn.sky1998.mongo.framework.util.SpringUtils;
import cn.sky1998.mongo.system.wxapp.WxappUtils;
import cn.sky1998.mongo.system.wxapp.XmlUtils;
import cn.sky1998.mongo.system.wxapp.domain.Article;
import cn.sky1998.mongo.system.wxapp.domain.ContentMsg;
import cn.sky1998.mongo.system.wxapp.domain.Image;
import cn.sky1998.mongo.wxapp.Event.PublicUserEvent;
import cn.sky1998.mongo.wxapp.Event.SwagEvent;
import cn.sky1998.mongo.wxapp.domain.*;
import cn.sky1998.mongo.wxapp.mapper.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import cn.sky1998.mongo.common.exception.WorkException;
import cn.sky1998.mongo.system.wxapp.service.WxappService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
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
 * @author tcy
 * @Date 15-12-2021
 */
@Service
public class WxappServiceImpl implements WxappService {

    @Value("${mango.wxapp.gzh.token}")
    private static String token;

    private Logger log = LoggerFactory.getLogger(WxappServiceImpl.class);

    private static RestTemplate restTemplate = (RestTemplate) SpringUtils.getBeanByName("restTemplate");


    private String qrCodeUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=%s";

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private WxappUtils wxappUtils;

    @Autowired
    private KeywordMapper keywordMapper;

    @Autowired
    private PublicUserMapper publicUserMapper;

    @Autowired
    private NightJoinMapper nightJoinMapper;

    @Autowired
    private PlanMapper planMapper;

    @Autowired
    private SwagMapper swagMapper;

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private MesaageMapper mesaageMapper;
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
            throw new WorkException("获取二维码异常");
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

        //查询该openid是否存在
        PublicUser publicUser = publicUserMapper.getPublicUserByopenid(openid);
        if (publicUser == null) {
            //获取、存储用户信息

            //--认证后放开
           // PublicUser userInfo = wxappUtils.getUserInfo(openid);

            PublicUser userInfo=new PublicUser();
            userInfo.setOpenid(openid);
            userInfo.setCreateTime(new Date());
            int i = publicUserMapper.insertSelective(userInfo);
            publicUser = publicUserMapper.getPublicUserByopenid(openid);
        }
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



        //根据消息类型处理 关注、菜单消息事件、活动消息
        String handleText = null;
        if (contentMsg.getMsgType().equals("text")) {
            //将该消息存档
            Mesaage mesaage=new Mesaage();
            mesaage.setCreateTime(new Date());
            mesaage.setOpenid(openid);
            mesaage.setMes(contentMsg.getContent());
            mesaageMapper.insertSelective(mesaage);

            handleText = handleText(contentMsg,publicUser);
        } else if (contentMsg.getMsgType().equals("event")) {
            handleText = handleEvent(contentMsg,publicUser);
        }

        return handleText;

    }


    /**
     * 处理事件（关注、菜单点击）
     *
     * @param contentMsg
     */
    public String handleEvent(ContentMsg contentMsg,PublicUser publicUser) {
        //关注事件
        if (contentMsg.getEvent().equals("subscribe")){
            //将该消息存档
            Mesaage mesaage=new Mesaage();
            mesaage.setCreateTime(new Date());
            mesaage.setOpenid(publicUser.getOpenid());
            mesaage.setMes("关注");
            mesaageMapper.insertSelective(mesaage);

            //注意 这边的 FromUserName 和 ToUserName 需要对调一下 因为现在是服务器发送给用户了
            String temp = contentMsg.getFromUserName();
            contentMsg.setFromUserName(contentMsg.getToUserName());
            contentMsg.setToUserName(temp);
            contentMsg.setMsgType("text");
            contentMsg.setCreateTime(new Date().getTime() + "");

            Keyword reply  = keywordMapper.selectByWord("关注回复");
            contentMsg.setContent(reply.getReply());
            return XmlUtils.parseToXml(contentMsg);

        }else if (contentMsg.getEvent().equals("CLICK")){

            //将该消息存档
            Mesaage mesaage=new Mesaage();
            mesaage.setCreateTime(new Date());
            mesaage.setOpenid(publicUser.getOpenid());
            mesaage.setMes("CLICK："+contentMsg.getEventKey());
            mesaageMapper.insertSelective(mesaage);

            ContentMsg contentMsg1=new ContentMsg();
            //注意 这边的 FromUserName 和 ToUserName 需要对调一下 因为现在是服务器发送给用户了


            contentMsg1.setFromUserName(contentMsg.getToUserName());
            contentMsg1.setToUserName(contentMsg.getFromUserName());
            contentMsg1.setCreateTime(new Date().getTime() + "");

            if (contentMsg.getEventKey().equals("zaoan")){
                contentMsg1.setMsgType("news");

                ArrayList<Article> articles = new ArrayList<>();
                Article article=new Article();
                article.setTitle("图文消息标题");
                article.setDescription("图文消息描述");
                article.setUrl("https://www.baidu.com");
                article.setPicUrl("https://bat-1300430211.cos.ap-nanjing.myqcloud.com/4kyingshi/203305-15073795856adc.jpg");
                articles.add(article);
                contentMsg1.setArticles(articles);
                contentMsg1.setArticleCount("1");
                return XmlUtils.beanToXml(contentMsg1);
            }else if (contentMsg.getEventKey().equals("connect")){

                //  System.out.println(contentMsg1.getFromUserName()+"点击了菜单");
                //根据菜单的key 实现对应的业务
                //    System.out.println(contentMsg1.getEventKey()+"按钮");

                contentMsg1.setMsgType("image");
                Image image=new Image();
                image.setMediaId("ZbwMulLSEdrgDt3mvkkjAn6vyeDrW6U1lSBjc7t_44f__3APRIJsraMovR3a_8ot");
                contentMsg1.setImage(image);
                return XmlUtils.beanToXml(contentMsg1);
            }

        }

        return null;
    }

    /**
     * 处理消息
     *
     * @param contentMsg
     */
    public String handleText(ContentMsg contentMsg,PublicUser publicUser) {

        //注意 这边的 FromUserName 和 ToUserName 需要对调一下 因为现在是服务器发送给用户了
        String temp = contentMsg.getFromUserName();
        contentMsg.setFromUserName(contentMsg.getToUserName());
        contentMsg.setToUserName(temp);
        contentMsg.setMsgType("text");
        contentMsg.setCreateTime(new Date().getTime() + "");

        final String receiveContentMsg = contentMsg.getContent();

        String[] split = receiveContentMsg.split("=");

        //收集 昵称、手机号、微信号
        if (split.length!=0){
            if (split[0].equals("昵称")){
                if (publicUser.getNickName()==null){
                    //异步发送通知 晚安互换通知信息
                    PublicUserEvent publicUserEvent=new PublicUserEvent(publicUser.getOpenid());
                    applicationContext.publishEvent(publicUserEvent);
                }
                publicUser.setNickName(split[1]);
                publicUserMapper.updateByPrimaryKeySelective(publicUser);
                contentMsg.setContent(searchWord("昵称设置通过"));


                return XmlUtils.parseToXml(contentMsg);
            }else if (split[0].equals("手机")){

                publicUser.setTel(split[1]);
                if (TelUtils.checkTel(split[1])){
                    publicUserMapper.updateByPrimaryKeySelective(publicUser);

                    //报名
                    //查询晚安计划进行的期数
                    Plan plan=new Plan();
                    plan.setName("晚安计划");
                    plan.setEnable(0);
                    Plan plan1 = planMapper.getPlan(plan);
                    if (plan1==null){
                        contentMsg.setContent(searchWord("活动结束"));
                        return XmlUtils.parseToXml(contentMsg);
                    }else {
                        NightJoin nightJoin=new NightJoin();
                        nightJoin.setOpenid(contentMsg.getToUserName());
                        nightJoin.setPlanId(plan1.getId());
                        List<NightJoinPlanUserVo> list = nightJoinMapper.getList(nightJoin);
                        if (list.size()==0){
                            //存到晚安计划报名表
                            nightJoin.setCreateTime(new Date());
                            nightJoinMapper.insertSelective(nightJoin);
                            contentMsg.setContent(searchWord("晚安计划"));
                            return XmlUtils.parseToXml(contentMsg);
                        }

                    }

                    contentMsg.setContent(searchWord("手机号设置通过"));
                }else {
                    contentMsg.setContent("手机号似乎不太对呀！请核对下手机号再来试哦");
                }

                return XmlUtils.parseToXml(contentMsg);
            }
            else if (split[0].equals("微信")){
                publicUser.setWxId(split[1]);
                publicUserMapper.updateByPrimaryKeySelective(publicUser);
                contentMsg.setContent("微信设置通过仅用于晚安计划交换");
                return XmlUtils.parseToXml(contentMsg);
            }
            else if (split[0].equals("我的话")){

                Plan plan=new Plan();
                plan.setName("晚安互换");
                plan.setEnable(0);
                Plan plan1 = planMapper.getPlan(plan);

                Swag swag=new Swag();
                swag.setMsg1(split[1]);
                swag.setCreateTime(new Date());
                swag.setOpenid(publicUser.getOpenid());
                swag.setPlanId(plan1.getId());

                //查询此次活动是否保存过，保存过无需再次添加
                List<Swag> listBySwag = swagMapper.getListBySwag(swag);
                if (listBySwag.size()==0){
                    //存储交换信息
                    swagMapper.insertSelective(swag);

                    contentMsg.setContent("收到，将尽快与你交换");
                    return XmlUtils.parseToXml(contentMsg);
                }

                //调用异步匹配事件--------------
                SwagEvent swagEvent=new SwagEvent(publicUser.getOpenid(),split[1],swag.getId());
                applicationContext.publishEvent(swagEvent);

            }
            else if (split[0].equals("留言")){

                //查询主动用户的匹配者，并推送消息
                Swag swag = swagMapper.getSwag(publicUser.getOpenid());

                //更新交换表的消息2（主动者）
                swag.setMsg2(split[1]);
                swagMapper.updateByPrimaryKeySelective(swag);
                String msg="给你留言了： "+split[1]+searchWord("回复");
                wxappUtils.sendKfMsg(msg,swag.getToOpenid());

                contentMsg.setContent(searchWord("留言成功"));
                return XmlUtils.parseToXml(contentMsg);
            }
            else if (split[0].equals("回复")){


                //查询主动用户的匹配者，并推送消息
                Swag list = swagMapper.getSwag(publicUser.getOpenid());
                String msg="回复了你： "+split[1];
                wxappUtils.sendKfMsg(msg,list.getToOpenid());

                //更新交换表的消息2（主动者）
                Plan plan=new Plan();
                plan.setName("晚安互换");
                plan.setEnable(0);
                Plan plan1 = planMapper.getPlan(plan);
                Swag swag=new Swag();
                swag.setPlanId(plan1.getId());
                swag.setOpenid(publicUser.getOpenid());
                Swag swagBySwag = swagMapper.getSwagBySwag(swag);
                swagBySwag.setMsg2(split[1]);
                swagMapper.updateByPrimaryKeySelective(swagBySwag);

                contentMsg.setContent(searchWord("回复成功"));
                return XmlUtils.parseToXml(contentMsg);
            }
        }

        if (receiveContentMsg.equals("晚安")) {

            if (publicUser.getTel() == null) {
                contentMsg.setContent(searchWord("没有手机号"));
                return XmlUtils.parseToXml(contentMsg);
            }else {
                    //查询晚安计划进行的期数
                    Plan plan=new Plan();
                    plan.setName("晚安计划");
                    plan.setEnable(0);
                Plan plan1 = planMapper.getPlan(plan);
                if (plan1==null){
                    contentMsg.setContent(searchWord("活动结束"));
                    return XmlUtils.parseToXml(contentMsg);
                }else {
                    NightJoin nightJoin=new NightJoin();
                    nightJoin.setOpenid(contentMsg.getToUserName());
                    nightJoin.setPlanId(plan1.getId());
                    List<NightJoinPlanUserVo> list = nightJoinMapper.getList(nightJoin);
                    if (list.size()==0){
                        //存到晚安计划报名表
                        nightJoin.setCreateTime(new Date());
                        nightJoinMapper.insertSelective(nightJoin);
                        contentMsg.setContent(searchWord("晚安计划"));
                        return XmlUtils.parseToXml(contentMsg);
                    }

                }

            }

        }else if (receiveContentMsg.equals("交换")){

            //if (publicUser.getWxId() == null) {
            //    contentMsg.setContent("您还没有微信哦，现在回复我一个微信吧。回复格式为，微信=***，如：微信=qingtengpai");
            //    return XmlUtils.parseToXml(contentMsg);
            //}

            if (publicUser.getNickName() == null) {
                contentMsg.setContent(searchWord("没有昵称"));

                return XmlUtils.parseToXml(contentMsg);
            }

            contentMsg.setContent(searchWord("交换"));
            return XmlUtils.parseToXml(contentMsg);


        }

       // return XmlUtils.parseToXml(contentMsg);

        return null;

    }


    public String searchWord(String key){
        Keyword keyword = keywordMapper.selectByWord(key);

        if (keyword!=null){
            return keyword.getReply();
        }else {
            return "没有找到关键字的回复哦";
        }

    }



}