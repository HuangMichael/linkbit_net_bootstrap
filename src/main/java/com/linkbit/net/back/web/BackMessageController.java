package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.message.Message;
import com.linkbit.net.front.domain.message.MessageRepository;
import com.linkbit.net.front.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/message")
public class BackMessageController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    MessageRepository messageRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Message> messageList = messageRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("留言信息");
        modelMap.put("headerDTO",headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("messageList", messageList);
        return "/back/message/index";
    }
}
