package com.linkbit.net.web;


import com.linkbit.net.front.domain.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.linkbit.net.front.domain.user.User;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    UserService userService;

    @RequestMapping("/create")
    public String create() {

        return "";
    }

    @RequestMapping("/edit")
    public String edit(int id) {

        return "edit";
    }


    @RequestMapping(value = "/findAllUsers", method = RequestMethod.GET)
    @ResponseBody
    public List<User> findAllUsers() {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<User> usersList = userService.findAllUsers();
        return usersList;
    }

    @RequestMapping("/index")
    public String index(Model model) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        List<User> userList = userService.findAllUsers();
        model.addAttribute("userList", userList);
        return "/user/list";
    }


    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User show(@PathVariable("id") Long id) {
        User user = new User();
        user.setId(id);
        user.setUserName("huangbin");
        return user;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public boolean delete(@PathVariable("id") Long id) {
        log.info(this.getClass().getSimpleName() + "--" + Thread.currentThread().getStackTrace()[1].getMethodName());
        return true;
    }
}
