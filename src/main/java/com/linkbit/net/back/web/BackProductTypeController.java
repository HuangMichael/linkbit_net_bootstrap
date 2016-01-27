package com.linkbit.net.back.web;

import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.productType.ProductType;
import com.linkbit.net.front.domain.productType.ProductTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台产品信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/productType/")
public class BackProductTypeController {

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    ProductTypeRepository productTypeRepository;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<ProductType> productTypeList = productTypeRepository.findAll();
        request.setAttribute("backMenusList", backMenusList);
        request.setAttribute("productTypeList", productTypeList);
        return "/back/productType/productType";
    }
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ProductType save(@ModelAttribute ProductType productType) {
        productTypeRepository.save(productType);
        return productType;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ProductType update(@ModelAttribute ProductType productType, HttpServletRequest request) {
        String id = request.getParameter("id");
        ProductType oldProduct = productTypeRepository.findById(Long.valueOf(id));
        productTypeRepository.save(productType);
        return productType;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        ProductType productType =  productTypeRepository.findById(id);
        productTypeRepository.delete(productType);

    }

}
