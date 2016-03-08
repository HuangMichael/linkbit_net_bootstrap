package com.linkbit.net.front.domain.product;

import org.springframework.data.repository.CrudRepository;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
public interface ProductCharactorRepository extends CrudRepository<ProductCharactor, Long> {

    /**
     * 根据产品属性id查找产品信息
     */
    ProductCharactor findById(long id);

    /**
     * 保存产品属性信息
     */
    ProductCharactor save(ProductCharactor productCharactor);
    /**
     * 删除产品属性 信息
     */
    void delete(ProductCharactor productCharactor);


}
