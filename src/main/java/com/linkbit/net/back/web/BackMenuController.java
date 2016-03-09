package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
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
 * 后台菜单控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/menu/")
public class BackMenuController {

    @Autowired
    MenuRepository menuRepository;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Menu> findAllMenus() {
        List<Menu> menusList = menuRepository.findAll();
        return menusList;
    }

    @RequestMapping("/findBackMenus")
    @ResponseBody
    public List<Menu> findAllBackMenus() {
        List<Menu> menusList = menuRepository.findByMenuType("1");
        return menusList;

    }

    @RequestMapping("/findFrontMenus")
    @ResponseBody
    public List<Menu> findFrontMenus() {
        List<Menu> menusList = menuRepository.findByMenuType("0");
        return menusList;

    }


    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Menu> menuList = menuRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "菜单信息");
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("menuList", menuList);
        return "/back/menu/index";
    }


    /**
     * 更新产品类别信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(@ModelAttribute Menu menu, @RequestParam("objId") Long objId) {
        if (objId != null) {
            Menu oldObj = menuRepository.findById(objId);
            oldObj.setStatus(menu.getStatus());
            oldObj.setMenuDesc(menu.getMenuDesc());
            oldObj.setMenuName(menu.getMenuName());
            oldObj.setUrl(menu.getUrl());
            oldObj.setSortNo(menu.getSortNo());
            menuRepository.save(oldObj);
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/back/menu/index");
        return modelAndView;
    }


    /**
     * 编辑产品类别信息
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        Menu menu = menuRepository.findById(id);
        Map<String, Menu> map = new HashMap<String, Menu>();
        map.put("menu", menu);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑菜单信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/menu/edit", map);
        return mv;
    }

}
