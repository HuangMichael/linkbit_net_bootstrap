package com.linkbit.net.front.domain.menu;


import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/8 0008.
 */
public interface MenuRepository extends CrudRepository<Menu, Long> {
    List<Menu> findByMenuName(String menuName);

}
