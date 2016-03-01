package com.linkbit.net.front.web;

import com.linkbit.net.front.domain.message.Message;
import com.linkbit.net.front.domain.message.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by huangbin on 2016/1/14 0014.
 */

@Controller
@EnableAutoConfiguration
@RequestMapping("/front/message0")
public class MessageController {
    @Autowired
    MessageRepository messageRepository;
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Message save(@ModelAttribute Message message) {
        message.setStatus("0");
        message.setMessageTime(new Date());
        return  messageRepository.save(message);
    }

}
