package com.linkbit.net.service.menu;


import com.linkbit.net.domain.menu.Menu;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 * 菜单接口
 */
@Service
public interface MenuService {

    /**
     * 创建对象
     */
    void create();

    /**
     * 根据id删除记录
     */
    boolean delete(long id);

    /**
     * 创建对象
     */
    List<Menu> findAllMenus();

    /**
     * 根据角色名查询菜单资源集合
     */
    List<Menu> findMenusByRole(String roleName);

    /**
     * 编辑记录
     */
    void edit(long id);

    /**
     * 按照菜单名称查询
     */
    List<Menu> findByMenuName(String menuName);

}
