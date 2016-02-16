package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.customers.Customer;
import com.linkbit.net.front.domain.customers.CustomerRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/customer")
public class BackCustomerController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    CustomerRepository customerRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Customer> customerList = customerRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("客户信息");
        modelMap.put("headerDTO",headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("customerList", customerList);
        return "/back/customer/index";
    }
}
