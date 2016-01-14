package com.linkbit.net.front.domain.menu;


import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface MenuRepository extends Repository<Menu, Long> {

    List<Menu> findByMenuName(String menuName);


    List<Menu> findAll();



}
