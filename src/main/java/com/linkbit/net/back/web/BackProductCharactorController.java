package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.product.ProductCharactor;
import com.linkbit.net.front.domain.product.ProductCharactorRepository;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by huangbin on 2016/1/20 0018.
 * 后台产品信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/productCharactor/")
public class BackProductCharactorController {

    @Autowired
    ProductCharactorRepository productCharactorRepository;
    @Autowired
    ProductRepository productRepository;


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ProductCharactor save(@ModelAttribute ProductCharactor productCharactor) {
        System.out.println("productCharactor-------------------" + productCharactor.toString());
        productCharactor.setProduct(productRepository.findById(1));
        productCharactorRepository.save(productCharactor);
        return productCharactor;
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Boolean delete(@PathVariable long id) {
        System.out.println("product----delete---------------" + id);
        ProductCharactor productCharactor = productCharactorRepository.findById(id);
        productCharactor.setProduct(null);
        productCharactorRepository.delete(productCharactor);
        return true;

    }

}
