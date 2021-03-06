package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/front/menu")
public class MenuController extends BaseController {
    @Autowired
    MenuRepository menuRepository;
    @RequestMapping("/findAll")
    @ResponseBody
    public List<Menu> findAllMenus() {
        List<Menu> menusList = menuRepository.findAll();
        return menusList;
    }


    @RequestMapping("/findFrontMenus")
    @ResponseBody
    public List<Menu> findFrontMenus() {
        List<Menu> menusList = menuRepository.findByMenuType("0");
        return menusList;
    }

}
