package com.linkbit.net.front.web;

import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/")
    public ModelAndView index() {
        // 查询最新产品
        String productType[] = {"1", "2", "3", "4"};
        Map<String, List<Product>> productMap = new HashMap<String, List<Product>>();
        for (String type : productType) {
            productMap.put("productList" + type, productRepository.findByProductType(type));
        }
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("product");
        modelAndView.addObject("productMap", productMap.values());
        return modelAndView;
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id) {
        // 查询最新产品
        Product product = productRepository.findByid(id);
        //封装对象 传递到页面
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productDetail");
        modelAndView.addObject("product", product);
        return modelAndView;
    }
}
