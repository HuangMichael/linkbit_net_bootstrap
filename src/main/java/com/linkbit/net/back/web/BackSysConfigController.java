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
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "系统设置信息");
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
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("sysConfig") SysConfig sysConfig,@RequestParam("objId")Long objId) {
        System.out.println("objId---------------------"+objId);
        if (objId != null) {
            SysConfig oldObj = sysConfigRepository.findById(objId);
            oldObj.setParaDesc(sysConfig.getParaDesc());
            oldObj.setParaName(sysConfig.getParaName());
            oldObj.setParaValue(sysConfig.getParaValue());
            oldObj.setStatus(sysConfig.getStatus());
            sysConfigRepository.save(oldObj);
        }
        return "redirect:/back/sysconfig/index";
    }

    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        SysConfig sysConfig = sysConfigRepository.findById(id);
        Map<String, SysConfig> map = new HashMap<String, SysConfig>();
        map.put("sysConfig", sysConfig);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑系统设置信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/sysconfig/edit", map);
        return mv;
    }


    @RequestMapping(value = "/detail/{id}",method = RequestMethod.POST)
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        SysConfig sysConfig = sysConfigRepository.findById(id);
        Map<String, SysConfig> map = new HashMap<String, SysConfig>();
        map.put("sysConfig", sysConfig);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "系统设置详细信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/sysconfig/detail", map);
        return mv;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        SysConfig sysConfig =  sysConfigRepository.findById(id);
        sysConfigRepository.delete(sysConfig);

    }



}
