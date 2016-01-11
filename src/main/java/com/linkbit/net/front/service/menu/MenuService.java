package com.linkbit.net.front.service.menu;


import com.linkbit.net.front.domain.menu.Menu;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 * 菜单接口
 */
@Service
public interface MenuService extends CrudRepository<Menu, Long> {

    @Override
    List<Menu> findAll();
}
