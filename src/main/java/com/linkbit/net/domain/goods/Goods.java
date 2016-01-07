package com.linkbit.net.domain.goods;

import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Component
public class Goods {
    private String goodsNo;
    private String goodsName;
    private double goodsPrice;
    private String goodsDesc;


    public Goods() {

    }

    public Goods(String goodsNo, String goodsName, double goodsPrice, String goodsDesc) {
        this.goodsNo = goodsNo;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsDesc = goodsDesc;
    }


    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public double getgoodsPrice() {
        return goodsPrice;
    }

    public void setgoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc;
    }

}
