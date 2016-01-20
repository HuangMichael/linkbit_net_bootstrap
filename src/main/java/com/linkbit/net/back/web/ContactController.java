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
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/contact")
public class ContactController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        request.setAttribute("backMenusList", backMenusList);
        return "/back/contact/contact";
    }
}
