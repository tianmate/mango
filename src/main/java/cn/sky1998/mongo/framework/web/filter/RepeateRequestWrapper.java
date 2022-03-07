package cn.sky1998.mongo.framework.web.filter;

import cn.sky1998.mongo.framework.webutils.HttpUtils;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.*;

/**
 * 构建可重复读取的HttpServletRequest
 * @author tcy
 * @Date 15-12-2021
 */
public class RepeateRequestWrapper extends HttpServletRequestWrapper {

    private final byte[] body;

    /**
     * 构造函数
     * @param request
     * @param response
     */
    public RepeateRequestWrapper(HttpServletRequest request, ServletResponse response) throws UnsupportedEncodingException {
        super(request);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        body = HttpUtils.getBodyByteArray(request);
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream byteArrayIns = new ByteArrayInputStream(body);
        ServletInputStream stream=new ServletInputStream() {
            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener listener) {

            }

            @Override
            public int read() throws IOException {
                return byteArrayIns.read();
            }
        };

        return stream;
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(this.getInputStream()));
    }
}