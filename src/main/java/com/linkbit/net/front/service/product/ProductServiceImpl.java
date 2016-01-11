package com.linkbit.net.front.service.product;

import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/1/11 0011.
 */
@Service
public class ProductServiceImpl implements ProductRepository {

    @Autowired
    ProductService productService;
    @Override
    public Iterable<Product> findAll() {
     return   productService.findAll();
    }

    @Override
    public <S extends Product> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Product> Iterable<S> save(Iterable<S> entities) {
        return null;
    }

    @Override
    public Product findOne(Long aLong) {
        return null;
    }

    @Override
    public boolean exists(Long aLong) {
        return false;
    }

    @Override
    public List<Product> findAll(Iterable<Long> longs) {


        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void delete(Long aLong) {

    }

    @Override
    public void delete(Product entity) {

    }

    @Override
    public void delete(Iterable<? extends Product> entities) {

    }

    @Override
    public void deleteAll() {

    }

}

