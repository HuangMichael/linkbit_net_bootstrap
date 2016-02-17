package com.linkbit.net.back.domain;

/**
 * Created by HUANGBIN on 2016/2/17 0017.
 * 封装网站 产品 资讯  信息等数量
 */
public class PortalNumberDTO {

    //所有产品信息数量
    private long allProductsCount;
    //所有新闻信息数量
    private long allNewsCount;
    //所有知识信息数量
    private long allKnowlegeCount;
    //所有客户信息数量
    private long allCustomersCount;
    //所有留言信息数量
    private long allMessageCount;


    public long getAllProductsCount() {
        return allProductsCount;
    }

    public void setAllProductsCount(long allProductsCount) {
        this.allProductsCount = allProductsCount;
    }

    public long getAllNewsCount() {
        return allNewsCount;
    }

    public void setAllNewsCount(long allNewsCount) {
        this.allNewsCount = allNewsCount;
    }

    public long getAllKnowlegeCount() {
        return allKnowlegeCount;
    }

    public void setAllKnowlegeCount(long allKnowlegeCount) {
        this.allKnowlegeCount = allKnowlegeCount;
    }

    public long getAllCustomersCount() {
        return allCustomersCount;
    }

    public void setAllCustomersCount(long allCustomersCount) {
        this.allCustomersCount = allCustomersCount;
    }

    public long getAllMessageCount() {
        return allMessageCount;
    }

    public void setAllMessageCount(long allMessageCount) {
        this.allMessageCount = allMessageCount;
    }
}
