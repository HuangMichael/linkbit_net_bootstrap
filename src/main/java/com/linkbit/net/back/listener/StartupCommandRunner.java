package com.linkbit.net.back.listener;

import com.linkbit.net.back.utils.MD5Util;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by huangbin on 2016/2/22 0022.
 */

@Component
@Order(value = 1)
public class StartupCommandRunner implements CommandLineRunner {

    @Autowired
    UserRepository userRepository;

    @Autowired
    MenuRepository menuRepository;

    @Override
    public void run(String... args) throws Exception {

        /**
         初始化数据信息
         添加用户信息
         */
        List<User> userList = userRepository.findAll();
        if (userList.isEmpty()) {
            User user = new User();
            user.setUserName("admin");
            user.setPassword(MD5Util.md5("123456"));
            user.setImgUrl("");
            user.setGender("1");
            user.setPersonName("管理员");
            user.setEmail("linkbit@linkbit.cn");
            user.setBirthday(new Date());
            user.setStatus("1");
            userRepository.save(user);
        }
        //初始化数据信息 添加前台菜单信息
        //添加菜单信息
        String menuNameArray[] = {"index", "product", "knowledge", "news", "company"};
        String menuDescArray[] = {"首页", "公司产品", "关于北斗", "行业资讯", "公司介绍"};
        // String urlArray[] = {"/index", "/product/", "/knowledge/", "/news/", "/company/"};
        String frontMenuType = "0";
        List<Menu> frontMenuList = menuRepository.findByMenuType("0");
        if (frontMenuList.isEmpty()) {
            for (int i = 0; i < menuNameArray.length; i++) {
                menuRepository.save(new Menu(i + 1, menuNameArray[i], menuDescArray[i], "", "/front/" + menuNameArray[i] + "/", frontMenuType, i + 1));
            }
        }
        //初始化数据信息添加后台菜单信息

        List<Menu> backMenuList = menuRepository.findByMenuType("1");
        String backMenuNameArray[] = {"portal", "product", "productType", "knowledge", "news", "company", "customer", "message", "user", "sysconfig"};
        String backMenuDescArray[] = {"网站信息", "产品管理", "产品类别管理", "知识管理", "新闻管理", "公司管理", "客户管理", "留言管理", "用户管理", "系统设置管理"};
        String backMenuClassArray[] = {
                "fa fa-bookmark-o fa-fw",
                "fa fa-desktop fa-fw",
                "fa fa-pencil-square-o fa-fw",
                "fa fa-bar-chart-o fa-fw",
                "fa fa-briefcase fa-fw",
                "fa fa-columns fa-fw",
                "fa fa-th-large fa-fw",
                "fa fa-pencil-square-o fa-fw",
                "fa fa-bookmark-o fa-fw",
                "fa fa-columns fa-fw"
        };
        String backMenuType = "1";
        if (backMenuList.isEmpty()) {
            for (int i = 0; i < backMenuNameArray.length; i++) {
                menuRepository.save(new Menu(i + menuNameArray.length + 1, backMenuNameArray[i], backMenuDescArray[i], backMenuClassArray[i], "/back/" + backMenuNameArray[i] + "/index", backMenuType, i + 1));
            }


        }


    }
}
