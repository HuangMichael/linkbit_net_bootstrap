package com.linkbit.net.back.listener;

import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * Created by huangbin on 2016/2/22 0022.
 */

@Component
@Order(value = 1)
public class StartupCommandRunner implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {

        System.out.println("StartupCommandRunner------------------------------1");

    }
}
