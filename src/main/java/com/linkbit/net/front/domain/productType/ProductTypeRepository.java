package com.linkbit.net.front.domain.productType;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/1/27 0027.
 */
public interface ProductTypeRepository extends CrudRepository<ProductType, Long> {
    /**
     * 查询所有的产品类型
     */
    List<ProductType> findAll();

    /**
     * 根据id查询产品类型
     */

    ProductType findById(Long id);



    /**
     * 查询所有的启用产品类型
     */
    List<ProductType> findByStatus(Boolean status);

}
