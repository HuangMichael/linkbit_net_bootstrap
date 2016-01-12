package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.Customers.Customer;
import com.linkbit.net.front.domain.Customers.CustomerRepository;
import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.service.menu.MenuService;
import com.linkbit.net.front.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
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
    KnowledgeRepository knowledgeRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    MenuService menuService;
    @RequestMapping("/")
    public String login(HttpServletRequest request) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        //查询导航主菜单
        List<Menu> menusList = menuService.findAll();
        request.getSession().setAttribute("menusList", menusList);
        // 跳转到index
        return "redirect:/index";
    }

    @RequestMapping("/logout")
    public String logout() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "index";
    }
    @RequestMapping("/index")
    public ModelAndView index() {
        // 查询最新产品
        List<Product> latestProductList = productRepository.findByOnline(true);
        //查询最新知识库信息
        List<Knowledge> latestKnowledgeList = knowledgeRepository.findByShowInMainPage(true);
        //查询客户信息
        List<Customer> customerList = customerRepository.findByShowInMainPage(true);
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("latestProductList", latestProductList);
        modelAndView.addObject("latestKnowledgeList", latestKnowledgeList);
        modelAndView.addObject("customerList", customerList);
        return modelAndView;
    }

    @RequestMapping("/product")
    public ModelAndView product() {
        // 查询最新产品
        List<Product> allProductList = productRepository.findAll();
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("product");
        modelAndView.addObject("allProductList", allProductList);
        return modelAndView;
    }


    @RequestMapping("/about")
    public String about() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "about";
    }

    @RequestMapping("/knowledge")
    public ModelAndView knowledge() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<Knowledge> knowledgeList = knowledgeRepository.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("knowledge");
        modelAndView.addObject("knowledgeList", knowledgeList);
        return modelAndView;
    }

    @RequestMapping("/customer")
    public String customers() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "customer";
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
