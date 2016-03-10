package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.back.utils.UploadUtil;
import com.linkbit.net.front.domain.company.Company;
import com.linkbit.net.front.domain.company.CompanyProperty;
import com.linkbit.net.front.domain.company.CompanyPropertyRepository;
import com.linkbit.net.front.domain.company.CompanyRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
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
 * Created by huangbin on 2016/1/18 0018.
 * 后台公司信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/company/")
@SessionAttributes("backMenusList")
public class BackCompanyController extends BackBaseController {

    @Autowired
    MenuRepository menuRepository;
    @Autowired
    CompanyRepository companyRepository;
    @Autowired

    CompanyPropertyRepository companyPropertyRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap ) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Company> companyList = companyRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统","公司信息",this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("companyList", companyList);
        return "/back/company/index";
    }


    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        Company company = companyRepository.findById(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("company", company);
        List<Company> companyList = companyRepository.findAll();
        map.put("companyList", companyList);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("公司信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/company/detail", map);
        return mv;
    }

    @Transactional
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("companyId") long companyId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "/front/images/company/" + fileName;
        String filePath = contextPath + realPath;
        UploadUtil.uploadFile(file, filePath);
        Company company = companyRepository.findById(companyId);
        company.setLogoPath(realPath);
        companyRepository.save(company);
        return "redirect:/back/company/detail/" + companyId;

    }

    @RequestMapping(value = "/saveProperty", method = RequestMethod.POST)
    @ResponseBody
    public CompanyProperty saveProperty(@ModelAttribute("companyProperty") CompanyProperty companyProperty, @RequestParam("cid") long cid) {
        CompanyProperty obj = companyProperty;
        obj.setCompany(companyRepository.findById(cid));
        companyPropertyRepository.save(obj);
        return companyProperty;
    }




}
