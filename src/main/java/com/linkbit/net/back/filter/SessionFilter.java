package com.linkbit.net.back.filter;

import com.linkbit.net.front.domain.user.User;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        System.out.println("过滤器----------------------do");
        User user = (User) httpServletRequest.getAttribute("user");
        if (user != null) {
            System.out.println("用户登录----------------------过滤器");
        } else {
            System.out.println("用户未登录----------------------过滤器");
        }
        chain.doFilter(httpServletRequest, httpServletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("过滤器----------------------destroy");
    }
}
