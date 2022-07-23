package cn.sky1998.mango.common.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author tcy
 * @Date 20-06-2022
 */
public class RegexUtils {

    /**
     * 正则表达式解析 专用于微信公众号文章解析
     * @param sourceText
     * @param reg
     * @return
     */
    public static List<String> parsing(String sourceText, String reg){

        List<String> targetUrls=new ArrayList<>();
        Pattern p = Pattern.compile(reg);
        //让正则对象和要作用的字符串相关联。获取匹配器对象。
        Matcher m  = p.matcher(sourceText);

        while(m.find())
        {

            targetUrls.add(m.group());
        }
        return targetUrls;

    }
}