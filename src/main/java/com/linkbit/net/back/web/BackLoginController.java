package com.linkbit.net.back.web;


import com.linkbit.net.back.utils.MD5Util;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import com.linkbit.net.front.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by huangbin on 2016/01/18 0023.
 * 后台控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/")
@SessionAttributes("user")
public class BackLoginController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String index(@RequestParam("userName") String userName, @RequestParam("password") String password, ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        User user = userRepository.findByUserNameAndPassword(userName, MD5Util.md5(password));
        String url = "/back/login/index";
        if (null != user) {
            modelMap.put("backMenusList", backMenusList);
            modelMap.put("user", user);
            url = "forward:/back/portal/index";
        }
        return url;
    }


    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    public String logout(HttpSession session) {
        session.invalidate();
        return "/back/login/index";
    }

}



