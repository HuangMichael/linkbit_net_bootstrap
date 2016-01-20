package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.message.Message;
import com.linkbit.net.front.domain.message.MessageRepository;
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
@RequestMapping("/back/message")
public class BackMessageController extends BaseController {
    @Autowired
    MenuRepository menuRepository;

    @Autowired
    MessageRepository messageRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Message> messageList = messageRepository.findAll();
        request.setAttribute("backMenusList", backMenusList);
        request.setAttribute("messageList", messageList);
        return "/back/message/message";
    }
}
