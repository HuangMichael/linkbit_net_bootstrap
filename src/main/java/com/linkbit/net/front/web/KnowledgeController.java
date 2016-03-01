package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * Created by huangbin on 2016/1/13 0013.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/front/knowledge")
public class KnowledgeController extends BaseController{

    @Autowired
    KnowledgeRepository knowledgeRepository;

    @RequestMapping(value="/findById",method = RequestMethod.GET)
    @ResponseBody
    public Knowledge findById(@PathParam("id") long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        return knowledge;
    }

    @RequestMapping("/")
    public ModelAndView knowledge() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<Knowledge> knowledgeList = knowledgeRepository.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/knowledge");
        modelAndView.addObject("knowledgeList", knowledgeList);
        return modelAndView;
    }



    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getKnowledgeDetail(@PathVariable("id") long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/knowledgeDetail");
        modelAndView.addObject("knowledge", knowledge);
        return modelAndView;
    }

}
