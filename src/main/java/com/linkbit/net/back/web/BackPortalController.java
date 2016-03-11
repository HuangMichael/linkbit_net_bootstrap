package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.AppAccessLogRepository;
import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.domain.PortalNumberDTO;
import com.linkbit.net.front.domain.customers.CustomerRepository;
import com.linkbit.net.front.domain.knowledge.KnowledgeRepository;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.message.Message;
import com.linkbit.net.front.domain.message.MessageRepository;
import com.linkbit.net.front.domain.news.NewsRepository;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台菜单控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/portal/")
@SessionAttributes("backMenusList")
public class BackPortalController {

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    NewsRepository newsRepository;

    @Autowired
    KnowledgeRepository knowledgeRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    MessageRepository messageRepository;

    @Autowired
    AppAccessLogRepository appAccessLogRepository;


    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        modelMap.put("backMenusList", backMenusList);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName(" 门户信息");
        modelMap.put("headerDTO", headerDTO);
        //查询所有的产品数量  上线产品数量
        long allProductsCount = productRepository.findAll().size();


        //所有新闻数量
        long allNewsCount = newsRepository.findAll().size();


        //所有知识信息数量
        long allKnowlegeCount = knowledgeRepository.findAll().size();

        //所有知识信息数量

        long allCustomersCount = customerRepository.findAll().size();

        //所有知识信息数量


        List<Message> unreadMessages  = messageRepository.findAllUnreadMessages();
        long allMessageCount = unreadMessages.size();


        PortalNumberDTO portalNumberDTO = new PortalNumberDTO();
        portalNumberDTO.setAllProductsCount(allProductsCount);
        portalNumberDTO.setAllNewsCount(allNewsCount);
        portalNumberDTO.setAllKnowlegeCount(allKnowlegeCount);
        portalNumberDTO.setAllCustomersCount(allCustomersCount);
        portalNumberDTO.setAllMessageCount(allMessageCount);
        modelMap.put("portalNumberDTO", portalNumberDTO);
        modelMap.put("unreadMessages", unreadMessages);
        List<String> appAccessLogList = appAccessLogRepository.findLast5DaysAccess();


        return "/back/portal/index";
    }
}
