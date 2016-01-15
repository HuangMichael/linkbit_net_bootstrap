package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.company.Company;
import com.linkbit.net.front.domain.company.CompanyRepository;
import com.linkbit.net.front.domain.customers.Customer;
import com.linkbit.net.front.domain.customers.CustomerRepository;
import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.news.News;
import com.linkbit.net.front.domain.news.NewsRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.domain.user.UserRepository;
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
    UserRepository userRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    KnowledgeRepository knowledgeRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    NewsRepository newsRepository;

    @Autowired
    CompanyRepository companyRepository;

    @Autowired
    MenuRepository menuRepository;
    @RequestMapping("/")
    public String login(HttpServletRequest request) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        //查询导航主菜单
        List<Menu> menusList = menuRepository.findAll();
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



    @RequestMapping("/about")
    public String about() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "about";
    }





    @RequestMapping("/customer")
    public String customers() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "customer";
    }


    @RequestMapping("/contact")
    public ModelAndView contact() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        Company company = companyRepository.findAll().get(0);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("contact");
        modelAndView.addObject("company", company);
        return modelAndView;

    }
    @RequestMapping("/showDetail")
    public String showDetail() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "detail";
    }


    @RequestMapping("/message")
    public String message() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "message";

    }


}
