package com.linkbit.net.front.web;


import com.linkbit.net.front.domain.news.News;
import com.linkbit.net.front.domain.news.NewsRepository;
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
 * Created by huangbin on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/news")
public class NewsController extends BaseController {

    @Autowired
    NewsRepository newsRepository;

    @RequestMapping("/")
    public ModelAndView news() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<News> newsList = newsRepository.findAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("news");
        modelAndView.addObject("newsList", newsList);
        return modelAndView;
    }

    @RequestMapping("/findAll")
    @ResponseBody
    public List<News> findAll() {
        List<News> newsList = newsRepository.findAll();
        return newsList;
    }


    @RequestMapping(value="/findById",method = RequestMethod.GET)
    @ResponseBody
    public News findById(@PathParam("id") long id) {
        News news = newsRepository.findById(id);
        return news;
    }

    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView getKnowledgeDetail(@PathVariable("id") long id) {
        News news = newsRepository.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("newsDetail");
        modelAndView.addObject("news", news);
        return modelAndView;
    }
}
