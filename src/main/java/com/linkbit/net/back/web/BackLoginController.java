package com.linkbit.net.back.web;


import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by huangbin on 2016/01/18 0023.
 * 后台控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back")
public class BackLoginController extends BaseController {

    @Autowired
    MenuRepository menuRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        request.setAttribute("backMenusList", backMenusList);
        return "/back/index";
    }


}
