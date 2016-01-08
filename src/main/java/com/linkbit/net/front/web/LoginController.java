package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.service.menu.MenuService;
import com.linkbit.net.front.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/")
public class LoginController extends BaseController {
    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;
    @RequestMapping("/")
    public String login() {
        return "index";
    }

    @RequestMapping("/logout")
    public String logout() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        log.info("注销session---------------------------------");
        return "index";
    }
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        Iterable<Menu> menusList = menuService.findAll();
        model.addAttribute("menusList", menusList);
        request.getSession().setAttribute("menusList", menusList);
        return "index";
    }
    @RequestMapping("/product")
    public String product() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());

        //公司产品 关于北斗 公司介绍 公司客户 联系我们
        //创造菜单

       /* String menuNameArray[] = new String[6];
        menuNameArray[0] = "index";
        menuNameArray[1] = "product";
        menuNameArray[2] = "beidou";
        menuNameArray[3] = "news";
        menuNameArray[4] = "contact";
        String menuArray[] = {"主页", "公司产品", "关于北斗", "行业新闻", "联系我们"};
        String iconArray[] = {"fa fa-laptop", "fa fa-envelope", "fa fa-copy", "fa fa-list-alt", "fa fa-desktop"};
        List<Menu> menusList = new ArrayList<Menu>();
        Menu menu = null;
        for (int i = 0; i < menuArray.length; i++) {
            System.out.println(i);
            menu = new Menu(i + 1, menuArray[i], menuArray[i], iconArray[i], "/" + menuNameArray[i], EnumMenuType.MODULE, i);
            menusList.add(menu);

        }
        menuService.save(menusList);*/

        return "product";
    }
    @RequestMapping("/about")
    public String about() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "about";
    }
    @RequestMapping("/beidou")
    public String beidou() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "beidou";
    }

    @RequestMapping("/customers")
    public String customers() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "customers";
    }
    @RequestMapping("/news")
    public String news() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "news";
    }

    @RequestMapping("/contact")
    public String contact() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "contact";
    }

    @RequestMapping("/showDetail")
    public String showDetail() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return "detail";
    }
}
