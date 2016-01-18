package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台产品信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/product/")
public class BackProductController {

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    ProductRepository productRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");

        List<Product> productList = productRepository.findAll();

        request.setAttribute("backMenusList", backMenusList);

        request.setAttribute("productList", productList);
        return "/back/product";
    }


    @RequestMapping("/findAllProducts")
    @ResponseBody
    public List<Product> findAllProducts() {
        List<Product> productList = productRepository.findAll();
        return productList;
    }


}
