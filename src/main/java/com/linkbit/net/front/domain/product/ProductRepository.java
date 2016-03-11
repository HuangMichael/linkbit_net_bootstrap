package com.linkbit.net.front.domain.product;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
public interface ProductRepository extends CrudRepository<Product, Long> {




    List<Product> findByOnline(boolean online);


    @Query("select p from Product p order by  p.productType.id, p.onLineDate")
    List<Product> findAll();

    /**
     * 根据产品了类型查找
     */
    List<Product> findByProductType(String type);

    /**
     * 根据产品id查找产品信息
     */
    Product findById(long id);

    /**
     * 保存产品信息
     */
    Product save(Product product);


    /**
     * 删除信息
     */
    void delete(Long id);






}
