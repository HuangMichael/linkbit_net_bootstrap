package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.MD5Util;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.back.utils.UploadUtil;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台用户信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/user/")
@SessionAttributes("backMenusList")
public class BackUserController extends BackBaseController {
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
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("userList", userList);
        modelMap.put("backMenusList", backMenusList);
        return "/back/user/index";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public User save(@ModelAttribute User user) {
        String password = MD5Util.md5("123456");
        System.out.println("password-------------------" + password);
        user.setPassword(password);
        userRepository.save(user);
        return user;
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("user") User user, @RequestParam("objId") Long objId) {
        System.out.println("objId---------------------" + objId);
        if (objId != null) {
            User oldObj = userRepository.findById(objId);
            oldObj.setBirthday(user.getBirthday());
            oldObj.setEmail(user.getEmail());
            oldObj.setGender(user.getGender());
            userRepository.save(oldObj);
        }
        return "forward:/back/user/index";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        User user = userRepository.findById(id);
        userRepository.delete(user);

    }


    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public ModelAndView showProfile(@PathVariable("id") Long id, ModelMap modelMap) {
        User user = userRepository.findById(id);
        Map<String, User> map = new HashMap<String, User>();
        map.put("user", user);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "个人信息", this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/user/profile", map);
        return mv;
    }


    /**
     * 上传图片 之后跳转至明细界面
     */
    @Transactional
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(@RequestParam("userId") long userId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "/front/images/user/" + fileName;
        String filePath = contextPath + realPath;
        UploadUtil.uploadFile(file, filePath);
        User user = userRepository.findById(userId);
        user.setImgUrl(realPath);
        userRepository.save(user);
        ModelAndView modelAndView = new ModelAndView("redirect:/back/user/profile/" + userId);
        return modelAndView;

    }

    @Transactional
    @RequestMapping(value = "/validatePwd", method = RequestMethod.POST)
    @ResponseBody
    public Boolean validatePwd(@RequestParam("oldPwd") String oldPwd, HttpServletRequest request) {
        boolean result = false;
        User user = SessionUtil.getCurrentUser(request);
        if (user != null) {
            result = MD5Util.md5(oldPwd).equals(user.getPassword());
        }
        return result;
    }


    @Transactional
    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    @ResponseBody
    public User changePassword(@RequestParam("oldPwd") String oldPwd,HttpServletRequest request) {
        User user = SessionUtil.getCurrentUser(request);
        user.setPassword(MD5Util.md5(oldPwd));
        userRepository.save(user);
        return  user ;
    }


}
