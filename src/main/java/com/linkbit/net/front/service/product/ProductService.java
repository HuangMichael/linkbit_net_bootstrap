package com.linkbit.net.front.service.product;


import com.linkbit.net.front.domain.product.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 * 菜单接口
 */
@Service
public interface ProductService extends CrudRepository<Product, Long> {


    //查询最新产品
    List<Product> findLatestProducts();


}
