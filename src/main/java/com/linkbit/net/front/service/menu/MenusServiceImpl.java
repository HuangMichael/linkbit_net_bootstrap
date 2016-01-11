package com.linkbit.net.front.service.menu;


import com.linkbit.net.front.domain.menu.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Service
public class MenusServiceImpl implements CrudRepository<Menu, Long> {

    @Autowired

    MenuService menuService;
    @Override
    public Menu findOne(Long aLong) {
        return null;
    }

    @Override
    public <S extends Menu> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Menu> Iterable<S> save(Iterable<S> entities) {
        return null;
    }

    @Override
    public boolean exists(Long aLong) {
        return false;
    }

    @Override
    public List<Menu> findAll() {
        return menuService.findAll();
    }

    @Override
    public Iterable<Menu> findAll(Iterable<Long> longs) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void delete(Long aLong) {

    }

    @Override
    public void delete(Menu entity) {

    }

    @Override
    public void delete(Iterable<? extends Menu> entities) {

    }

    @Override
    public void deleteAll() {

    }
}
