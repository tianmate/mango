package cn.sky1998.mongo.wxapp.Event;

import cn.sky1998.mongo.system.wxapp.WxappUtils;
import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.domain.PublicUser;
import cn.sky1998.mongo.wxapp.domain.Swag;
import cn.sky1998.mongo.wxapp.mapper.KeywordMapper;
import cn.sky1998.mongo.wxapp.mapper.PublicUserMapper;
import cn.sky1998.mongo.wxapp.service.SwagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * @author tcy
 * @Date 18-02-2022
 */
@Component
public class SwagListener implements ApplicationListener<SwagEvent> {

    @Autowired
    private SwagService swagService;

    @Autowired
    private PublicUserMapper publicUserMapper;

    @Autowired
    private WxappUtils wxappUtils;

    @Autowired
    private KeywordMapper keywordMapper;


    @Async
    @Override
    public void onApplicationEvent(SwagEvent event) {

       //被匹配用户（被动方）
        Swag search = swagService.search(event.getOpenid());

        //主动方（）
        Swag swagByid = swagService.getSwagByid(event.getSwagId());
        //没有匹配到 推送通知

        if (search!=null){
            //被动人信息
            PublicUser publicUserByopenid = publicUserMapper.getPublicUserByopenid(search.getOpenid());
            String msgA="@ "+publicUserByopenid.getNickName()+"与你交换了祝福"+search.getMsg1();
            //向主动方发送消息
            wxappUtils.sendKfMsg(msgA,event.getOpenid());

            //主动人信息
            PublicUser publicUserByopenid1 = publicUserMapper.getPublicUserByopenid(event.getOpenid());
            //向被动方发送消息
            String msgP="@ "+publicUserByopenid1.getNickName()+"与你交换了祝福"+event.getMsg();
            wxappUtils.sendKfMsg(msgP,publicUserByopenid.getOpenid());

            //匹配后存档
            search.setToOpenid(event.getOpenid());
            //更新被动人信息
            swagService.updata(search);

            //更新主动人信息
            swagByid.setToOpenid(publicUserByopenid.getOpenid());
            swagService.updata(swagByid);
            //再次推送消息
            wxappUtils.sendKfMsg(searchWord("留言"),event.getOpenid());

        }

        System.out.println("调用这个异步任务...");
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