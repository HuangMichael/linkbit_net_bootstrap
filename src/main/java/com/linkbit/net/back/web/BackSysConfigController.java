package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.domain.SysConfig;
import com.linkbit.net.back.domain.SysConfigRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台用户信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/sysconfig/")
@SessionAttributes("backMenusList")
public class BackSysConfigController {
    /**
     * 菜单接口
     */
    @Autowired
    MenuRepository menuRepository;
    /**
     * 用户接口
     */
    @Autowired
    SysConfigRepository sysConfigRepository;


    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<SysConfig>   sysconfigList = sysConfigRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("系统设置信息");
        modelMap.put("headerDTO",headerDTO);
        modelMap.put("sysconfigList", sysconfigList);
        modelMap.put("backMenusList", backMenusList);
        return "/back/sysconfig/index";
    }



    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public SysConfig save(@ModelAttribute SysConfig sysConfig) {
        sysConfigRepository.save(sysConfig);
        return sysConfig;
    }
    /*

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Product update(@ModelAttribute Product product, HttpServletRequest request) {
        String id = request.getParameter("id");
        Product oldProduct = productRepository.findById(Long.valueOf(id));
        productRepository.save(product);
        return product;
    }
*/
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        SysConfig sysConfig =  sysConfigRepository.findById(id);
        sysConfigRepository.delete(sysConfig);

    }



}
