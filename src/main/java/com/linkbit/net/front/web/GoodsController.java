package com.linkbit.net.web;


import com.linkbit.net.front.domain.customer.Customer;
import com.linkbit.net.front.domain.goods.Goods;
import com.linkbit.net.front.domain.service.goods.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Controller
@EnableAutoConfiguration
@RequestMapping("/goods")
public class GoodsController extends BaseController {
    @Autowired
    GoodsService goodsService;
    @RequestMapping("/create")
    public Customer create() {
        goodsService.create();
        Customer customer = new Customer("goods", new Date());
        return customer;
    }
    @RequestMapping("/findAllGoods")
    @ResponseBody
    public List<Goods> findAllGoods() {
        log.info(this.getClass().getSimpleName()+"--"+Thread.currentThread().getStackTrace()[1].getMethodName());
        List<Goods> goodsList = goodsService.findAllGoods();
        return goodsList;
    }

    @RequestMapping("/index")
    public String  index() {
        log.info(this.getClass().getSimpleName()+"--"+Thread.currentThread().getStackTrace()[1].getMethodName());
        return "index";
    }
}
