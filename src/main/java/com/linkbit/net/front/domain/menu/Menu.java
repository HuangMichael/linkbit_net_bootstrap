package com.linkbit.net.front.domain.menu;


import com.linkbit.net.front.utils.EnumMenuType;

import javax.persistence.*;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 菜单
 */
@Entity
@Table(name="T_MENU")
public class Menu {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long id;
    private String menuName;
    private String menuDesc;
    private String iconClass;
    private String url;
    private EnumMenuType menuType;

    private long sortNo;


    public Menu() {

    }

    public Menu(long id, String menuName, String menuDesc, String iconClass, String url, EnumMenuType menuType, long sortNo) {
        this.id = id;
        this.menuName = menuName;
        this.menuDesc = menuDesc;
        this.iconClass = iconClass;
        this.url = url;
        this.menuType = menuType;
        this.sortNo = sortNo;
    }
}
