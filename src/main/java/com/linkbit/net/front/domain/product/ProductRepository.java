package com.linkbit.net.front.domain.product;

import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
public interface ProductRepository extends Repository<Product, Long> {


    List<Product> findByProductName(String productName);


    List<Product> findByOnline(boolean online);

    List<Product> findAll();
}
