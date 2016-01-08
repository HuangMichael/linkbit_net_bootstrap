package com.linkbit.net.front.domain.menu;


import com.linkbit.net.utils.EnumMenuType;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2015/12/23 0023.
 * 菜单
 */
@Component
public class Menu {
    private long id;
    private String menuName;
    private String menuDesc;
    private String iconClass;
    private String url;
    private EnumMenuType menuType;
    private Menu parent;
    private long sortNo;


    public Menu() {

    }

    public Menu(long id, String menuName, String menuDesc, String iconClass, String url, EnumMenuType menuType, Menu parent, long sortNo) {
        this.id = id;
        this.menuName = menuName;
        this.menuDesc = menuDesc;
        this.iconClass = iconClass;
        this.url = url;
        this.menuType = menuType;
        this.parent = parent;
        this.sortNo = sortNo;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuDesc() {
        return menuDesc;
    }

    public void setMenuDesc(String menuDesc) {
        this.menuDesc = menuDesc;
    }


    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public EnumMenuType getMenuType() {
        return menuType;
    }

    public void setMenuType(EnumMenuType menuType) {
        this.menuType = menuType;
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public long getSortNo() {
        return sortNo;
    }

    public void setSortNo(long sortNo) {
        this.sortNo = sortNo;
    }
}
