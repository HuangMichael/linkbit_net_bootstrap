package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.back.utils.UploadUtil;
import com.linkbit.net.front.domain.customers.Customer;
import com.linkbit.net.front.domain.customers.CustomerRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/customer")
public class BackCustomerController extends BackBaseController {
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


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        Customer customer =  customerRepository.findById(id);
        customerRepository.delete(customer);
    }



    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        Customer customer = customerRepository.findById(id);
        Map<String,Customer> map = new HashMap<String, Customer>();
        map.put("customer",customer);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("客户详细信息");
        modelMap.put("headerDTO",headerDTO);
        ModelAndView mv = new ModelAndView("/back/customer/detail",map);
        return mv;
    }


    @Transactional
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("customerId") long customerId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "/front/images/customer/" + fileName;
        String filePath = contextPath + realPath;
        UploadUtil.uploadFile(file, filePath);
        Customer customer = customerRepository.findById(customerId);
        customer.setLogoPath(realPath);
        customerRepository.save(customer);
        return "forward:/back/customer/detail/" + customerId;

    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Customer save(@ModelAttribute Customer customer) {
        customerRepository.save(customer);
        return customer;
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("customer") Customer customer,@RequestParam("objId")Long objId) {
        if (objId != null) {
            Customer oldObj = customerRepository.findById(objId);
            oldObj.setCustomerName(customer.getCustomerName());
            oldObj.setAddress(customer.getAddress());
            oldObj.setFax(customer.getFax());
            oldObj.setMainPage(customer.getMainPage());
            oldObj.setTelephone(customer.getTelephone());
            customerRepository.save(oldObj);
        }
        return "redirect:/back/customer/index";
    }

    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        Customer customer = customerRepository.findById(id);
        Map<String, Customer> map = new HashMap<String, Customer>();
        map.put("customer", customer);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑客户信息",this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/customer/edit", map);
        return mv;
    }
}
