package com.linkbit.net.front.domain.menu;


import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface MenuRepository extends CrudRepository<Menu, Long> {
    /**
     * 查询所有菜单
     */
    List<Menu> findAll();

    /**
     * 根据菜单类型查询菜单集合  0为前台菜单   1 为后台菜单
     */
    List<Menu> findByMenuType(String menuType);

    /**
     * 根据id查询
     */
    Menu findById(long id);


}
