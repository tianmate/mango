package cn.sky1998.mongo.common.utils;

/**
 * 处理并记录日志文件
 * 
 * @author tcy
 */
public class LogUtils
{
    public static String getBlock(Object msg)
    {
        if (msg == null)
        {
            msg = "";
        }
        return "[" + msg.toString() + "]";
    }
}
