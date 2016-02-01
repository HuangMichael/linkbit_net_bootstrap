package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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


    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        request.setAttribute("backMenusList", backMenusList);
        return "/back/menu/index";
    }

}
