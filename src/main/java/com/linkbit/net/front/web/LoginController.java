package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.company.Company;
import com.linkbit.net.front.domain.company.CompanyRepository;
import com.linkbit.net.front.domain.customers.Customer;
import com.linkbit.net.front.domain.customers.CustomerRepository;
import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.news.NewsRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/")
@SessionAttributes("menusList")
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
    public String login(ModelMap modelMap) {
        //查询导航主菜单

        // 跳转到index
        return "redirect:/index";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "index";
    }
    @RequestMapping("/index")
    public ModelAndView index(ModelMap modelMap) {

        List<Menu> menusList = menuRepository.findByMenuType("0");
        modelMap.put("menusList", menusList);
        // 查询最新产品
        List<Product> latestProductList = productRepository.findByOnline(true);
        //查询最新知识库信息
        List<Knowledge> latestKnowledgeList = knowledgeRepository.findByShowInMainPage(true);
        //查询客户信息
        List<Customer> customerList = customerRepository.findByShowInMainPage(true);
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/index");
        modelAndView.addObject("latestProductList", latestProductList);
        modelAndView.addObject("latestKnowledgeList", latestKnowledgeList);
        modelAndView.addObject("customerList", customerList);
        return modelAndView;
    }



    @RequestMapping("/about")
    public String about() {
        return "/front/about";
    }

    @RequestMapping("/customer")
    public String customers() {
        return "/front/customer";
    }


    @RequestMapping("/contact")
    public ModelAndView contact() {
        Company company = companyRepository.findAll().get(0);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/contact");
        modelAndView.addObject("company", company);
        return modelAndView;
    }
    @RequestMapping("/showDetail")
    public String showDetail() {
        return "/front/detail";
    }


    @RequestMapping("/message")
    public String message() {
        return "/front/message";

    }


}
