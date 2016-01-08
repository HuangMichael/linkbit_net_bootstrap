package com.linkbit.net.front.web;


import com.linkbit.net.front.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/")
public class LoginController extends BaseController {
    @Autowired
    UserService userService;
    @RequestMapping("/")
    public String login() {
        return "index";
    }

    @RequestMapping("/logout")
    public String logout() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        log.info("注销session---------------------------------");
        return "index";
    }

    @RequestMapping("/index")
    public String index() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "index";
    }
    @RequestMapping("/product")
    public String product() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "product";
    }
    @RequestMapping("/about")
    public String about() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "about";
    }
    @RequestMapping("/beidou")
    public String beidou() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "beidou";
    }

    @RequestMapping("/customers")
    public String customers() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "customers";
    }
    @RequestMapping("/news")
    public String news() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "news";
    }

    @RequestMapping("/contact")
    public String contact() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "contact";
    }

    @RequestMapping("/showDetail")
    public String showDetail() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "detail";
    }
}
