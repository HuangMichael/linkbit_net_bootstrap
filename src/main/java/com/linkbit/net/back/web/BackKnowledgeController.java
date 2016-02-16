package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台 知识库信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/knowledge")
@SessionAttributes("backMenusList")
public class BackKnowledgeController {

    @Autowired
    MenuRepository menuRepository;
    @Autowired
    KnowledgeRepository knowledgeRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Knowledge> knowledgeList = knowledgeRepository.findAll();

        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("知识信息");
        modelMap.put("headerDTO", headerDTO);


        modelMap.put("backMenusList", backMenusList);
        modelMap.put("knowledgeList", knowledgeList);
        return "/back/knowledge/index";
    }


    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        Map<String, Knowledge> map = new HashMap<String, Knowledge>();
        map.put("knowledge", knowledge);
        ModelAndView mv = new ModelAndView("/back/knowledge/detail", map);
        return mv;
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        Knowledge knowledge = knowledgeRepository.findById(id);
        knowledgeRepository.delete(knowledge);

    }


    /**
     * 保存知识信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute  Knowledge knowledge) {
        knowledgeRepository.save(knowledge);
        return "/back/knowledge/index";
    }

}
