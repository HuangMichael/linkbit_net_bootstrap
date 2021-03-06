package com.linkbit.net.front.web;

import com.linkbit.net.front.domain.message.Message;
import com.linkbit.net.front.domain.message.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * Created by huangbin on 2016/1/14 0014.
 */

@Controller
@EnableAutoConfiguration
@RequestMapping("/front/message")
public class MessageController {
    @Autowired
    MessageRepository messageRepository;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute Message message) {
        message.setMessageTime(new Date());
        message.setStatus("0");
        messageRepository.save(message);
        return "redirect:/front/message";
    }

}
