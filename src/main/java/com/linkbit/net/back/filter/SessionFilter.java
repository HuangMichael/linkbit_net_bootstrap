package com.linkbit.net.back.filter;

import com.linkbit.net.front.domain.user.User;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2016/3/1 0001.
 */
@Component("sessionFilter")
@WebFilter
public class SessionFilter implements javax.servlet.Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("过滤器----------------------init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        // 判断是否是http请求
        if (!(servletRequest instanceof HttpServletRequest)
                || !(servletResponse instanceof HttpServletResponse)) {
            throw new ServletException(
                    "OncePerRequestFilter just supports HTTP requests");
        }
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        HttpSession session = httpRequest.getSession(true);

        String[] strs = {"login", "logout","front"}; // 路径中包含这些字符串的,可以不用登录直接访问
        StringBuffer url = httpRequest.getRequestURL();

        /**
         * 过滤掉根目录
         */
        String path = httpRequest.getContextPath();
        String protAndPath = httpRequest.getServerPort() == 8080 ? "" : ":"
                + httpRequest.getServerPort();
        String basePath = httpRequest.getScheme() + "://"
                + httpRequest.getServerName() + protAndPath + path + "/";
        if (basePath.equalsIgnoreCase(url.toString())) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        // 特殊用途的路径可以直接访问
        if (strs != null && strs.length > 0) {
            for (String str : strs) {
                if (url.indexOf(str) >= 0) {
                    filterChain.doFilter(servletRequest, servletResponse);
                    return;
                }
            }
        }
        // 从session中获取用户信息
        User user = (User) session.getAttribute("user");
        if (null != user) {
            // 用户存在,可以访问此地址
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            // 用户不存在,踢回登录页面
            String returnUrl = httpRequest.getContextPath() + "/back/logout";
            httpRequest.setCharacterEncoding("UTF-8");
            httpResponse.setContentType("text/html; charset=UTF-8"); // 转码
            httpResponse.sendRedirect(returnUrl);
            return;
        }

    }

    @Override
    public void destroy() {
        System.out.println("过滤器----------------------destroy");
    }
}
