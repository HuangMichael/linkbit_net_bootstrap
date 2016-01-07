package com.linkbit.net.service.menu;


import com.linkbit.net.domain.menu.Menu;
import com.linkbit.net.utils.EnumMenuType;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Service
public class MenusServiceImpl implements MenuService {
    @Override
    public void create() {

    }


    @Override
    public List<Menu> findAllMenus() {

        //公司产品 关于北斗 公司介绍 公司客户 联系我们
        //创造菜单

        String menuNameArray[] = new String[6];
        menuNameArray[0] = "index";
        menuNameArray[1] = "product";
        menuNameArray[2] = "beidou";
        menuNameArray[3] = "news";
        menuNameArray[4] = "customers";
        menuNameArray[5] = "contact";
        String menuArray[] = {"公司主页","公司产品", "关于北斗", "行业新闻", "公司客户", "联系我们"};
        String iconArray[] = {"fa fa-laptop", "fa fa-envelope", "fa fa-copy", "fa fa-list-alt", "fa fa-desktop",""};
        List<Menu> menusList = new ArrayList<Menu>();
        Menu menu = null;
        for (int i = 0; i < menuArray.length; i++) {
            System.out.println(i);
            menu = new Menu(i, menuArray[i], menuArray[i], iconArray[i], "/portal/list/" + i, EnumMenuType.MODULE, null, i);
            menusList.add(menu);
        }
        return menusList;
    }


    @Override
    public List<Menu> findMenusByRole(String roleName) {
        List<Menu> menusList = this.findAllMenus();
        return menusList;
    }


    @Override
    public void edit(long id) {
        System.out.println("edit menu------------------" + id);
    }


    @Override
    public boolean delete(long id) {
        System.out.println("delete menu------------------");
        return true;
    }


    @Override
    public List<Menu> findByMenuName(String menuName) {
        List<Menu> menusList = this.findAllMenus();
        return menusList;
    }
}
