package com.linkbit.net.front.domain.customers;

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

    /**
     * 根据id查询 的客户信息
     */
    Customer findById(long id);


    /**
     * 保存客户信息
     */
    Customer save(Customer customer);
    /**
     * 删除客户信息
     */
   void  delete(Customer customer);
}
