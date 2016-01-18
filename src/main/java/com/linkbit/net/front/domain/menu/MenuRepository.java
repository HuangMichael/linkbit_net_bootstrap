package com.linkbit.net.front.domain.menu;


import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface MenuRepository extends Repository<Menu, Long> {
    /**
     * 查询所有菜单
     */
    List<Menu> findAll();

    /**
     * 根据菜单类型查询菜单集合
     */
    List<Menu> findByMenuType(String menuType);



}
