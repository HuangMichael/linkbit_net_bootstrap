package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.knowledge.Knowledge;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台 知识库信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/knowledge/")
public class BackKnowledgeController {

    @Autowired
    MenuRepository menuRepository;
    @Autowired
    KnowledgeRepository knowledgeRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Knowledge> knowledgeList = knowledgeRepository.findAll();
        request.setAttribute("backMenusList", backMenusList);
        request.setAttribute("knowledgeList", knowledgeList);
        return "/back/knowledge";
    }

}
