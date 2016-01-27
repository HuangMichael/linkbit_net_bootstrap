package com.linkbit.net.front.domain.productType;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/1/27 0027.
 */
public interface ProductTypeRepository extends CrudRepository<ProductType, Long> {

    List<ProductType> findAll();

    ProductType findById(Long id);

}
