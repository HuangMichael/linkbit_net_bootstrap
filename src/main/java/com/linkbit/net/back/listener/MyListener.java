package com.linkbit.net.back.listener;

import org.springframework.stereotype.Component;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Created by huangbin on 2016/3/1 0001.
 */

@Component("myListener")
@WebListener
public class MyListener implements ServletContextListener {
    /**
     * @param arg0
     * @see javax.servlet.ServletContextListener#contextDestroyed(javax.servlet.ServletContextEvent)
     */
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        System.out.println("监听器上下文销毁-------------");
    }
    /**
     * @param arg0
     * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
     */
    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        System.out.println("监听器上下文初始化-------------");
    }

}