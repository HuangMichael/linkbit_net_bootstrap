package com.linkbit.net;

/**
 * Created by Administrator on 2016/1/27 0027.
 */
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class MvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/index").setViewName("home");
        registry.addViewController("/").setViewName("home");
        registry.addViewController("/product").setViewName("product");
        registry.addViewController("/knowledge").setViewName("knowledge");
        registry.addViewController("/contact").setViewName("contact");
        registry.addViewController("/news").setViewName("news");
    }

}