package cn.sky1998.mongo.framework.util;

import javax.servlet.ServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import static java.nio.charset.StandardCharsets.UTF_8;

/**
 * @author tcy
 * @Date 14-12-2021
 */
public class HttpUtils {

    public static byte[] getBodyByteArray(ServletRequest request) {
        return getBodyString(request).getBytes();
    }

    /**
     * 获取json数据的body
     * @param request
     * @return
     */
    public static String getBodyString(ServletRequest request) {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream(), UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException ignored) {
        }
        return sb.toString();
    }
}