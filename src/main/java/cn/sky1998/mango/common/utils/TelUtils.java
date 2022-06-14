package cn.sky1998.mango.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author tcy@1753163342@qq.com
 * @Date 16-02-2022
 */
public class TelUtils {

    public static boolean checkTel(String str){

        String reg="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";

        Pattern p = Pattern.compile(reg);

        Matcher m  = p.matcher(str);

        return m.matches();
    }


}