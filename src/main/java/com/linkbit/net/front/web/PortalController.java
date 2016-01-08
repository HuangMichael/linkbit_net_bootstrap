package com.linkbit.net.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/portal")
public class PortalController extends BaseController {
    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/list/{id}")
    public String login(@PathVariable("id") int id, Model model) {
        /*添加链接*/
        String menuArray[] = new String[6];
        menuArray[0] = "index";
        menuArray[1] = "product";
        menuArray[2] = "beidou";
        menuArray[3] = "about";
        menuArray[4] = "customers";
        menuArray[5] = "contact";
        List<Menu> menuList = menuService.findAllMenus();
        model.addAttribute("menuList", menuList);
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return menuArray[id];
    }

}
