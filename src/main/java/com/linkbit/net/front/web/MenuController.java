package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.service.menu.MenuService;
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
@RequestMapping("/menu")
public class MenuController extends BaseController {
    @Autowired
    MenuService menuService;
    @RequestMapping("/findAll")
    @ResponseBody
    public List<Menu> findAllMenus() {
        List<Menu> menusList = menuService.findAll();

        for(Menu menu:menusList){

            System.out.println(menu);
        }
        return menusList;
    }

}