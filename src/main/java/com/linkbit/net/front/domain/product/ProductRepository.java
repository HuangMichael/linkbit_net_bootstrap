package com.linkbit.net.front.domain.product;

import org.springframework.data.repository.CrudRepository;

/**
 * Created by Administrator on 2016/1/11 0011.
 */
public interface ProductRepository extends CrudRepository<Product, Long> {

    @Override
    Iterable<Product> findAll();


}
