package cn.sky1998.mongo.wxapp.Event;

import cn.sky1998.mongo.system.wxapp.WxappUtils;
import cn.sky1998.mongo.wxapp.domain.Keyword;
import cn.sky1998.mongo.wxapp.mapper.KeywordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * @author tcy
 * @Date 22-02-2022
*/
@Component
public class SwagNoticeListener implements ApplicationListener<PublicUserEvent> {

    @Autowired
    private KeywordMapper keywordMapper;

    @Autowired
    private WxappUtils wxappUtils;


    @Async
    @Override
    public void onApplicationEvent(PublicUserEvent event) {
        Keyword keyword = keywordMapper.selectByWord("交换");
        wxappUtils.sendKfMsg(keyword.getReply(),event.getOpenid());
        System.out.println("调用这个异步任务...");
    }
}