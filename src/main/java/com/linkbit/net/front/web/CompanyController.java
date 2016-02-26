package com.linkbit.net.front.web;

import com.linkbit.net.front.domain.company.Company;
import com.linkbit.net.front.domain.company.CompanyPropertyRepository;
import com.linkbit.net.front.domain.company.CompanyRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/company")
@SessionAttributes("backMenusList")
public class CompanyController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    CompanyRepository companyRepository;
    @Autowired
    CompanyPropertyRepository companyPropertyRepository;


    // 查询最新产品

    @RequestMapping("/")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        modelMap.put("backMenusList", backMenusList);
        Company company = companyRepository.findAll().get(0);
        modelMap.put("company", company);
        return "/front/company";
    }

}
