package com.linkbit.net.back.listener;

import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

/**
 * Created by huangbin on 2016/2/22 0022.
 * 系统初始化
 */
public class ApplicationStartup implements ApplicationListener<ContextRefreshedEvent> {



    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {


    }
}

