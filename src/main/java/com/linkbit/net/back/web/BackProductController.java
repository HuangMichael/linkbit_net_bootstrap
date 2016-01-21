package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "/back/product/product";
    }


    @RequestMapping("/findAllProducts")
    @ResponseBody
    public List<Product> findAllProducts() {
        List<Product> productList = productRepository.findAll();
        return productList;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Product save(@ModelAttribute Product product) {
        
        productRepository.save(product);
        return product;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Product update(@ModelAttribute Product product, HttpServletRequest request) {
        String id = request.getParameter("id");
        Product oldProduct = productRepository.findById(Long.valueOf(id));
        productRepository.save(product);
        return product;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
       Product product =  productRepository.findById(id);
        productRepository.delete(product);

    }

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id) {
        Product product = productRepository.findById(id);
        Map<String,Product>  map = new HashMap<String, Product>();map.put("product",product);
        ModelAndView mv = new ModelAndView("/back/product/detail",map);
        return mv;
    }
}
