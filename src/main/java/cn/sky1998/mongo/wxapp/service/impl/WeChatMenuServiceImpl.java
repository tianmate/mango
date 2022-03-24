package cn.sky1998.mongo.wxapp.service.impl;

import cn.sky1998.mongo.framework.util.SpringUtils;
import cn.sky1998.mongo.wxapp.service.WeChatMenuService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * @author tcy
 * @Date 15-02-2022
 */
@Service
public class WeChatMenuServiceImpl implements WeChatMenuService {

    private static RestTemplate restTemplate = (RestTemplate) SpringUtils.getBeanByName("restTemplate");

    @Override
    public String getMenu() {
        String menu=" {\n" +
                "     \"button\":[\n" +
                "     {\t\n" +
                "          \"type\":\"click\",\n" +
                "          \"name\":\"今日歌曲\",\n" +
                "          \"key\":\"V1001_TODAY_MUSIC\"\n" +
                "      },\n" +
                "      {\n" +
                "           \"name\":\"菜单\",\n" +
                "           \"sub_button\":[\n" +
                "           {\t\n" +
                "               \"type\":\"view\",\n" +
                "               \"name\":\"搜索\",\n" +
                "               \"url\":\"http://www.soso.com/\"\n" +
                "            },\n" +
                "            {\n" +
                "                 \"type\":\"miniprogram\",\n" +
                "                 \"name\":\"wxa\",\n" +
                "                 \"url\":\"http://mp.weixin.qq.com\",\n" +
                "                 \"appid\":\"wx286b93c14bbf93aa\",\n" +
                "                 \"pagepath\":\"pages/lunar/index\"\n" +
                "             },\n" +
                "            {\n" +
                "               \"type\":\"click\",\n" +
                "               \"name\":\"赞一下我们\",\n" +
                "               \"key\":\"V1001_GOOD\"\n" +
                "            }]\n" +
                "       }]\n" +
                " }";
        restTemplate.postForEntity(" https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN",menu,String.class);

        return menu;
    }
}