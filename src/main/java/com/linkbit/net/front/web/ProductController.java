package com.linkbit.net.front.web;

import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.domain.productType.ProductType;
import com.linkbit.net.front.domain.productType.ProductTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 产品控制器类
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/product")
public class ProductController extends BaseController {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductTypeRepository  productTypeRepository;

    @RequestMapping("/")
    public ModelAndView index() {
        // 查询最新产品

       List<ProductType> productTypeList =  productTypeRepository.findByStatus(true);
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/product");
        modelAndView.addObject("productTypeList", productTypeList);
      //  modelAndView.addObject("productTypeList", productTypeList);
        return modelAndView;
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id) {
        // 查询最新产品
        Product product = productRepository.findById(id);
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/productDetail");
        modelAndView.addObject("product", product);
        return modelAndView;
    }
}
