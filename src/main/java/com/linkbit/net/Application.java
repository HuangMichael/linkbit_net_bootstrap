

package com.linkbit.net;

import com.linkbit.net.back.listener.ApplicationStartup;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
@ComponentScan
@SpringBootApplication
public class Application {
 public static void main(String[] args) {
     SpringApplication springApplication = new SpringApplication(Application.class);
     springApplication.addListeners(new ApplicationStartup());
     SpringApplication.run(Application.class, args);
    }
}
