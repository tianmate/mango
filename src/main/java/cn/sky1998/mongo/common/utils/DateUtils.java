package cn.sky1998.mongo.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author tcy
 * @Date 15-02-2022
 */
public class DateUtils {

    public static Date stampToDate(Integer stamp){

        SimpleDateFormat format =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );

        Integer time=new Integer( stamp);

        String d = format.format(time);

        Date date= null;
        try {
            date = format.parse(d);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return date;
    }
}