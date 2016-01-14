package com.linkbit.net.front.web;

import com.linkbit.net.front.service.menu.domain.knowledge.Knowledge;
import com.linkbit.net.front.service.menu.domain.knowledge.KnowledgeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.websocket.server.PathParam;

/**
 * Created by huangbin on 2016/1/13 0013.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/knowledge")
public class KnowledgeController {

    @Autowired
    KnowledgeRepository knowledgeRepository;

    @RequestMapping(value="/findById",method = RequestMethod.GET)
    @ResponseBody
    public Knowledge findById(@PathParam("id") long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        return knowledge;
    }
}
