package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.productType.ProductType;
import com.linkbit.net.front.domain.productType.ProductTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangbin on 2016/1/18 0018.
 * 后台产品信息控制器
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/back/productType/")
public class BackProductTypeController  extends  BackBaseController{

    @Autowired
    MenuRepository menuRepository;

    @Autowired
    ProductTypeRepository productTypeRepository;

    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        System.out.println( "indexUrl------------------"+    this.getIndexUrl());
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<ProductType> productTypeList = productTypeRepository.findAll();
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("产品类型信息");
        headerDTO.setUrlName(this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("productTypeList", productTypeList);
        return "/back/productType/index";
    }

    /**
     * 保存产品类别信息
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ProductType save(@ModelAttribute ProductType productType) {
        productType.setStatus("0"); //默认启用
        productTypeRepository.save(productType);
        return productType;
    }

    /**
     * 更新产品类别信息
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(@ModelAttribute ProductType productType, Long objId) {
        if (objId != null) {
            ProductType oldObj = productTypeRepository.findById(objId);
            oldObj.setTypeName(productType.getTypeName());
            oldObj.setStatus(productType.getStatus());
            productTypeRepository.save(oldObj);
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/back/productType/index");
        return modelAndView;
    }

    /**
     * 编辑产品类别信息
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        ProductType productType = productTypeRepository.findById(id);
        Map<String, ProductType> map = new HashMap<String, ProductType>();
        map.put("productType", productType);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑产品类别信息",this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/productType/edit", map);
        return mv;
    }


    /**
     * 删除产品类别信息
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
        ProductType productType = productTypeRepository.findById(id);
        productTypeRepository.delete(productType);

    }

    /**
     * 编辑产品类别信息
     */
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public ModelAndView detail(@PathVariable("id") Long id, ModelMap modelMap) {
        ProductType productType = productTypeRepository.findById(id);
        Map<String, ProductType> map = new HashMap<String, ProductType>();
        map.put("productType", productType);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑产品类别信息",this.getIndexUrl());
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/productType/detail", map);
        return mv;
    }

}
