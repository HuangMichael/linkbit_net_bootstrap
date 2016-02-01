package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.news.News;
import com.linkbit.net.front.domain.news.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台新闻信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/news/")
@SessionAttributes("backMenusList")
public class BackNewsController {

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    NewsRepository newsRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<News> newsList = newsRepository.findAll();
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("newsList", newsList);
        return "/back/news/index";
    }

}
