package com.linkbit.net.back.web;

import com.linkbit.net.back.domain.HeaderDTO;
import com.linkbit.net.back.utils.SessionUtil;
import com.linkbit.net.back.utils.UploadUtil;
import com.linkbit.net.front.domain.menu.Menu;
import com.linkbit.net.front.domain.menu.MenuRepository;
import com.linkbit.net.front.domain.product.Product;
import com.linkbit.net.front.domain.product.ProductCharactor;
import com.linkbit.net.front.domain.product.ProductRepository;
import com.linkbit.net.front.domain.productType.ProductType;
import com.linkbit.net.front.domain.productType.ProductTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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
@SessionAttributes({"backMenusList","productTypeList"})
public class BackProductController {
    /**
     * 菜单接口
     */
    @Autowired
    MenuRepository menuRepository;
    /**
     * 产品接口
     */
    @Autowired
    ProductRepository productRepository;
    /**
     * 产品类型接口
     */
    @Autowired
    ProductTypeRepository productTypeRepository;
    @RequestMapping("/index")
    public String index(ModelMap modelMap) {
        List<Menu> backMenusList = menuRepository.findByMenuType("1");
        List<Product> productList = productRepository.findAll();
        List<ProductType> productTypeList = productTypeRepository.findByStatus("1");
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "产品信息");
        modelMap.put("headerDTO",headerDTO);
        modelMap.put("productTypeList", productTypeList);
        modelMap.put("backMenusList", backMenusList);
        modelMap.put("productList", productList);
        return "/back/product/index";
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
        product.setProductCharactorSet(null);
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


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable("id") Long id, ModelMap modelMap) {
        Product product = productRepository.findById(id);
        Map<String, Product> map = new HashMap<String, Product>();
        map.put("product", product);
        HeaderDTO headerDTO = new HeaderDTO("网站后台管理系统", "编辑产品信息");
        modelMap.put("headerDTO", headerDTO);
        ModelAndView mv = new ModelAndView("/back/product/edit", map);
        return mv;
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(@PathVariable long id) {
       Product product =  productRepository.findById(id);
        productRepository.delete(product);

    }

    @RequestMapping("/detail/{id}")
    public ModelAndView detail(@PathVariable("id") Long id,ModelMap modelMap) {
        Product product = productRepository.findById(id);
        Map<String,Product>  map = new HashMap<String, Product>();
        map.put("product",product);
        HeaderDTO headerDTO = new HeaderDTO();
        headerDTO.setSystemName("网站后台管理系统");
        headerDTO.setAppName("产品详细信息");
        modelMap.put("headerDTO",headerDTO);
        ModelAndView mv = new ModelAndView("/back/product/detail",map);
        return mv;
    }


    @RequestMapping(value="/findCharactorListById/{id}",method = RequestMethod.GET)
    @ResponseBody
    public List<ProductCharactor> findById(@PathVariable("id") Long id) {
        Product product = productRepository.findById(id);
        List<ProductCharactor> productCharactorList =  product.getProductCharactorSet();
        return productCharactorList;
    }

    @Transactional
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("productId") long newsId, @RequestParam("fileName") String fileName, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String contextPath = SessionUtil.getContextPath(request);
        String realPath = "/front/images/news/" + fileName;
        String filePath = contextPath + realPath;
        UploadUtil.uploadFile(file, filePath);
        Product product = productRepository.findById(newsId);
        product.setProductImgUrl(realPath);
        productRepository.save(product);
        return "forward:/back/product/detail/" + newsId;

    }
}
