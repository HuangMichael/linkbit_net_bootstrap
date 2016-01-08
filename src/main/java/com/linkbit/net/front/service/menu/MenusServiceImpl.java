package com.linkbit.net.front.service.menu;


import com.linkbit.net.front.domain.menu.Menu;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Service
public  abstract  class MenusServiceImpl implements CrudRepository<Menu, Long> {

/*
 *//*   @Override
    public <S extends T> S save(S entity) {
        return null;
    }

    @Override
    public <S extends T> Iterable<S> save(Iterable<S> entities) {
        return null;
    }*//*


    @Override
    public Menu findOne(Long aLong) {
        return null;
    }

    @Override
    public boolean exists(Long aLong) {
        return false;
    }

    @Override
    public Iterable<Menu> findAll() {
        return null;
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
            menu = new Menu(i, menuArray[i], menuArray[i], iconArray[i], "/portal/list/" + i, EnumMenuType.MODULE, i);
            menusList.add(menu);
        }
        return menusList;
    }

    @Override
    public List<Menu> findByMenuName(String menuName) {
        List<Menu> menusList = this.findAllMenus();
        return menusList;
    }*/



    @Override
    public Menu findOne(Long aLong) {
        return null;
    }

    @Override
    public boolean exists(Long aLong) {
        return false;
    }

    @Override
    public Iterable<Menu> findAll() {
        return null;
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
