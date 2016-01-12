package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.service.menu.MenuService;
import com.linkbit.net.front.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/")
public class LoginController extends BaseController {
    @Autowired
    UserService userService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    MenuService menuService;
    @RequestMapping("/")
    public String login() {
        return "index";
    }

    @RequestMapping("/logout")
    public String logout() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "index";
    }
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, Model model) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        //查询导航主菜单
        List<Menu> menusList = menuService.findAll();
        request.getSession().setAttribute("menusList", menusList);

        //todo 查询最新产品
        List<Product> latestProductList = productRepository.findByOnline(true);

        //封装对象 传递到页面

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("menusList", menusList);
        modelAndView.addObject("latestProductList", latestProductList);
        return modelAndView;
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
