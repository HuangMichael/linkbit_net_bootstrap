package com.linkbit.net.web;


import com.linkbit.net.domain.menu.Menu;
import com.linkbit.net.service.menu.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/menu")
public class MenuController extends BaseController {
    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/findAllMenus", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> findAllMenus() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<Menu> menuList = menuService.findAllMenus();
        return menuList;
    }

    @RequestMapping(value = "/findMenusByRole", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> findMenusByRole(@RequestParam String roleName) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<Menu> menuList = menuService.findMenusByRole(roleName);
        return menuList;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public boolean delete(@PathVariable("id") long id) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        boolean result = menuService.delete(id);
        return result;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    @ResponseBody
    public void edit(@PathVariable("id") long id) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        menuService.edit(id);
    }


    @RequestMapping(value = "/findByMenuName/{menuName}", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> findByMenuName(@PathVariable("menuName") String menuName) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return menuService.findByMenuName(menuName);
    }


}
