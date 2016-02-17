package com.linkbit.net;

import com.linkbit.net.back.interceptors.Interceptor2;
import com.linkbit.net.back.interceptors.UserSecurityInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(new UserSecurityInterceptor()).addPathPatterns("/back/portal/index");
        registry.addInterceptor(new UserSecurityInterceptor()).excludePathPatterns("/back/logout");
        registry.addInterceptor(new Interceptor2()).excludePathPatterns("/back/login");
        super.addInterceptors(registry);
    }

}