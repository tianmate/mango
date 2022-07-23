package cn.sky1998.mango.framework.utils.aholp;

import cn.sky1998.mango.common.utils.FileUtils;
import cn.sky1998.mango.common.utils.RegexUtils;
import cn.sky1998.mango.framework.web.core.AjaxResult;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author tcy
 * @Date 27-05-2022
 */
@Component
public class SpiderUtil {

    // 微信公众号文章域名
    private static final String WX_DOMAIN = "https://mp.weixin.qq.com";
    // 文章返回前端统一key常量
    private static final String KEY_TITLE = "title"; // 文章标题
    private static final String KEY_COVER_URL = "coverLink"; // 文章封面图链接
    private static final String KEY_REFER_NAME = "referName"; // 文章出处作者
    private static final String KEY_REFER_URL = "referLink"; // 文章出处链接
    private static final String KEY_TAGS = "tags"; // 文章内容
    private static final String KEY_NAME = "name"; // 标签名称
    private static final String KEY_TEXT = "text"; // 文本信息
    private static final String KEY_HREF = "href"; // a标签链接

    @Resource
    private FileUtils fileUtils;

    /**
     * 根据文章链接抓取文章内容
     *
     * @param url 文章链接
     * @return 文章内容
     */
    public AjaxResult getActicle(String url) {
        // 检测链接是否合法
        String msg = checkUrl(url);
        if (msg != null) {
            return AjaxResult.error("解析失败");
        }

        // 请求与响应
        String resp = HttpTool.get(url, getWxHeaderMap());
        if (resp == null || resp.trim().length() == 0) {
            return AjaxResult.error("文章获取失败，请检查链接是否正确");
        }
        // 解析
        Map map = getWxActicleContent(resp, url);

        return AjaxResult.success(map);
    }

    /**
     * 检测文章链接是否合法
     */
    public String checkUrl(String url) {
        if (url == null) {
            return "请输入文章链接";
        }
        if (!url.startsWith(WX_DOMAIN)) {
            return "请输入微信公众号文章链接";
        }
        return null;
    }


    /**
     * 微信公众号请求头设置
     */
    public Map<String, String> getWxHeaderMap() {
        Map<String, String> map = new HashMap<>(new LinkedHashMap<>());
        map.put("Accept", "text/html, application/xhtml+xml, image/jxr, */*");
        map.put("Accept-Encoding", "gzip, deflate");
        map.put("Accept-Language", "zh-Hans-CN, zh-Hans; q=0.8, en-US; q=0.5, en; q=0.3");
        map.put("Host", "mp.weixin.qq.com");
        map.put("If-Modified-Since", "Sat, 04 Jan 2020 12:23:43 GMT");
        map.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko");
        return map;
    }


    /**
     * 解析微信公众号文章
     *
     * @param resp 请求文章响应
     * @param url 文章链接
     * @return 文章信息
     */
    public Map getWxActicleContent(String resp, String url) {
        try {
            Document document = Jsoup.parse(resp);
            // 文章出处（作者）
            String referName = document.getElementsByClass("profile_nickname").get(0).text();

            // 文章封面图链接
            String coverUrl = document.select("meta[property=\"og:image\"]").get(0).attr("content");
            // 文章标题
            String title = document.getElementById("activity-name").text();

            //封面图下载到腾讯云，换图片链接
            coverUrl= fileUtils.uploadTencentOssFromUrl(coverUrl,url);

            // 文章内容
            Element content = document.getElementsByClass("rich_media_content").get(0);
           // Node div = content.append("div").childNode(1);
            Elements children = content.children();

            //替换图片地址
          //  String s = replaceUrls(children.get(0), url);

           // 替换剩余的块
           // for (int i = 1; i < children.size(); i++) {

                //替换图片地址
              //  String s1 = replaceUrls(children.get(i), url);

                //s.concat(s1);
              //  Firstelement.append(element.toString());

           // }

            Map map=new HashMap(4);
            map.put("author",referName);
            map.put("cover",coverUrl);
            map.put("title",title);
            map.put("content",children.toString());
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            Map mapErr=new HashMap();
            mapErr.put("msg","文章解析失败");
            return mapErr;
        }
    }


    /**
     * 传入待解析的 html 返回替换后的 html
     * @param childs
     * @param url
     * @return
     */
    public String replaceUrls(Element childs,String url){
        String reg="((https://mmbiz.qlogo.cn)|(https://mmbiz.qpic.cn))+.*?((wx_fmt=jpeg)|(wx_fmt=other)|(wx_fmt=png))";
        List<String> FirstSourceurls = RegexUtils.parsing(childs.toString(), reg);
        String result=new String();
        if (FirstSourceurls.size()!=0){
            String FirsttargetArticleUrl;

            for (int i = 0; i < FirstSourceurls.size(); i++) {

                FirsttargetArticleUrl= fileUtils.uploadTencentOssFromUrl(FirstSourceurls.get(i),url);
                //文章封面转换为腾讯云oss
                result= childs.toString().replace(FirstSourceurls.get(i), FirsttargetArticleUrl);
            }

        }

        return result;
    }

}
