package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductCharactor;
import com.linkbit.net.front.domain.product.ProductCharactorRepository;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
    public String save(@RequestParam("charactorName")String charactorName ,@RequestParam("charactorDesc")String charactorDesc,  @RequestParam("pid") Long pid) {
        Product product = productRepository.findById(pid);
        ProductCharactor  productCharactor =  new ProductCharactor();
        productCharactor.setCharactorDesc(charactorDesc);
        productCharactor.setCharactorName(charactorName);
        productCharactor.setProduct(product);
        productCharactor.setStatus(true);
        productCharactorRepository.save(productCharactor);
        return "redirect:/back/product/index";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Boolean delete(@PathVariable long id) {
        ProductCharactor productCharactor = productCharactorRepository.findById(id);
        productCharactor.setProduct(null);
        productCharactorRepository.delete(productCharactor);
        return true;

    }

}
