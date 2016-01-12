package com.linkbit.net.front.domain.Customers;

import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/12 0012.
 */
public interface CustomerRepository extends Repository<Customer, Long> {

    /**
     * 查询首页中显示的信息
     */

    List<Customer> findByShowInMainPage(Boolean showInMainPage);

    /**
     * 查询所有的客户信息
     */
    List<Customer> findAll();
}
