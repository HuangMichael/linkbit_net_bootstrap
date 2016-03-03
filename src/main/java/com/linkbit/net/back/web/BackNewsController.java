package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.back.utils.UploadUtil;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.news.News;
import com.linkbit.net.front.domain.news.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("新闻信息");
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("newsList", newsList);
        return "/back/news/index";
    }


    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        News news = newsRepository.findById(id);
        Map<String, News> map = new HashMap<String, News>();
        map.put("news", news);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("新闻详细信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/news/detail", map);
        return mv;
    }

    @RequestMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id") Long id) {
        News news = newsRepository.findById(id);
        Map<String, News> map = new HashMap<String, News>();
        map.put("news", news);
        ModelAndView mv = new ModelAndView("/back/news/edit", map);
        return mv;
    }



    /**
     * 保存新闻信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute News news) {
        news.setPublishTime(new Date());
        newsRepository.save(news);
        return "/back/news/index";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("news") News news, @RequestParam("objId")Long objId) {
        System.out.println("objId---------------------"+objId);
        if (objId != null) {
            News oldObj =  newsRepository.findById(objId);
            oldObj.setImgUrl(news.getImgUrl());
            oldObj.setPublishTime(news.getPublishTime());
            oldObj.setKeywords(news.getKeywords());
            oldObj.setNewsContent(news.getNewsContent());
            oldObj.setNewsDesc(news.getNewsDesc());
            oldObj.setNewsTitle(news.getNewsTitle());
            oldObj.setStatus(news.getStatus());
            newsRepository.save(oldObj);
        }
        return "forward:/back/news/index";
    }



    @Transactional
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("newsId") long newsId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "/front/images/news/" + fileName;
        String filePath = contextPath + realPath;
        UploadUtil.uploadFile(file, filePath);
        News news = newsRepository.findById(newsId);
        news.setImgUrl(realPath);
        newsRepository.save(news);
        return "forward:/back/news/detail/" + newsId;

    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        News news =  newsRepository.findById(id);
        newsRepository.delete(news);

    }


}
