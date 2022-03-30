package cn.sky1998.mongo.framework.web.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author tcy@1753163342@qq.com
 * @Date 15-12-2021
 */
public class RepeateFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        RepeateRequestWrapper requestWrapper  = new RepeateRequestWrapper(request,response);
        if(requestWrapper == null){
            chain.doFilter(request,response);
        }else {
            chain.doFilter(requestWrapper,response);
        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}