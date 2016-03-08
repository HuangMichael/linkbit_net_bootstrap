package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.role.Role;
import com.linkbit.net.front.domain.role.RoleRepository;
import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台产品信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/role/")
public class BackRoleController {

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Role> roleList = roleRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("角色信息");
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("roleList", roleList);
        return "/back/role/index";
    }

    /**
     * 保存产品类别信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute Role role) {
        role.setStatus("1"); //默认启用
        roleRepository.save(role);
        return "/back/role/index";
    }

    /**
     * 更新产品类别信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(@ModelAttribute Role role, Long objId) {
        if (objId != null) {
            Role oldObj = roleRepository.findById(objId);
            oldObj.setRoleName(role.getRoleName());
            oldObj.setRoleDesc(role.getRoleDesc());
            oldObj.setStatus(role.getStatus());
            roleRepository.save(oldObj);
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/back/role/index");
        return modelAndView;
    }

    /**
     * 编辑产品类别信息
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        Role role = roleRepository.findById(id);
        Map<String, Role> map = new HashMap<String, Role>();
        map.put("role", role);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑角色信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/role/edit", map);
        return mv;
    }


    /**
     * 删除产品类别信息
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        Role role = roleRepository.findById(id);
        roleRepository.delete(role);

    }

    /**
     * 编辑产品类别信息
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        Role role = roleRepository.findById(id);
        List<User> usersList = userRepository.findAll();
        Map<String, Role> map = new HashMap<String, Role>();
        map.put("role", role);

        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "角色明细信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/role/detail", map);
        mv.addObject("usersList", usersList);
        return mv;
    }

    /**
     * 删除产品类别信息
     */
    @RequestMapping(value = "/choose", method = RequestMethod.POST)
    @ResponseBody
    public String choose(@RequestParam("ids") String ids, @RequestParam("roleId") Long roleId) {
        System.out.println("ids----------------------" + ids.toString());

        System.out.println("roleId----------------------" + roleId.toString());
        String array[] = new String[]{};
        Set<User> userSet = new HashSet<User>();
        if (!ids.equals("")) {
            array = ids.split(",");
        }
        User user;
        for (String userId : array) {
            user = userRepository.findById(Long.valueOf(userId));
            userSet.add(user);

            System.out.println("userSet----------------------" + userSet.toString());
        }
        Role role = roleRepository.findById(roleId);
        role.setUsers(userSet);
        System.out.println("role----------------------" + role.toString());
        roleRepository.save(role);
        return ids;

    }

}
