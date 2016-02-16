package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台菜单控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/portal/")
@SessionAttributes("backMenusList")
public class BackPortalController {

    @Autowired
    MenuRepository menuRepository;


    @RequestMapping("/index")
        public String index(ModelMap modelMap) {
            List<Menu> backMenusList = menuRepository.findByMenuType("1");
            modelMap.put("backMenusList", backMenusList);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName(" 门户信息");
        modelMap.put("headerDTO", headerDTO);

        return "/back/portal/index";
    }
}
