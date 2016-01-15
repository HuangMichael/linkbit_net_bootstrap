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

    /**
     * 根据产品了类型查找
     */
    List<Product> findByProductType(String type);

    /**
     * 根据产品id查找产品信息
     */
    Product findByid(long id);
}
