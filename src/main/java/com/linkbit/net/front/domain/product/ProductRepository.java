package com.linkbit.net.front.domain.product;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
public interface ProductRepository extends CrudRepository<Product, Long> {
    /**
     * 根据在线状态查询
     */
    List<Product> findByOnline(boolean online);

    /**
     * 查询所有产品
     */
    @Query("select p from Product p order by  p.productType.id asc, p.onLineDate desc,p.sortNo asc")
    List<Product> findAll();

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
