package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台用户信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/user/")
@SessionAttributes("backMenusList")
public class BackUserController {
    /**
     * 菜单接口
     */
    @Autowired
    MenuRepository menuRepository;
    /**
     * 用户接口
     */
    @Autowired
    UserRepository userRepository;


    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<User> userList = userRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("用户信息");
        modelMap.put("headerDTO",headerDTO);
        modelMap.put("userList", userList);
        modelMap.put("backMenusList", backMenusList);
        return "/back/user/index";
    }



    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public User save(@ModelAttribute User user) {
        userRepository.save(user);
        return user;
    }


   /* @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Product update(@ModelAttribute Product product, HttpServletRequest request) {
        String id = request.getParameter("id");
        Product oldProduct = productRepository.findById(Long.valueOf(id));
        productRepository.save(product);
        return product;
    }*/

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
       User user =  userRepository.findById(id);
        userRepository.delete(user);

    }



}
