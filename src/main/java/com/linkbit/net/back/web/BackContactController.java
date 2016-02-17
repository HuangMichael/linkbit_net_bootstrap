package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.company.Company;
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
 * Created by huangbin on 2016/1/18 0018.
 * 后台公司信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/contact/")
@SessionAttributes("backMenusList")
public class BackContactController {

    @Autowired
    MenuRepository menuRepository;
    @Autowired
    CompanyRepository companyRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap ) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Company> companiesList = companyRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("公司信息");
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("companiesList", companiesList);
        return "/back/contact/index";
    }

}
