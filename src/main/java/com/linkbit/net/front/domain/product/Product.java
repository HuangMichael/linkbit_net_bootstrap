package com.linkbit.net.front.domain.product;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.linkbit.net.front.domain.productType.ProductType;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
@Entity
@Table(name = "T_PRODUCT")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String productName;
    private String productDesc;
    private String productImgUrl;
    private Boolean showInMainPage;
    private Long sortNo;
    @Temporal(TemporalType.DATE)
    private Date onLineDate;
    private boolean online;
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonBackReference("productCharactorSet")
    private List<ProductCharactor> productCharactorSet = new ArrayList<ProductCharactor>();
    @ManyToOne(cascade = CascadeType.ALL, optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_type_id", referencedColumnName = "id")
    private ProductType productType;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }



    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductImgUrl() {
        return productImgUrl;
    }

    public void setProductImgUrl(String productImgUrl) {
        this.productImgUrl = productImgUrl;
    }

    public Boolean getShowInMainPage() {
        return showInMainPage;
    }

    public void setShowInMainPage(Boolean showInMainPage) {
        this.showInMainPage = showInMainPage;
    }

    public Long getSortNo() {
        return sortNo;
    }

    public void setSortNo(Long sortNo) {
        this.sortNo = sortNo;
    }

    public Date getOnLineDate() {
        return onLineDate;
    }

    public void setOnLineDate(Date onLineDate) {
        this.onLineDate = onLineDate;
    }

    public boolean isOnline() {
        return online;
    }

    public void setOnline(boolean online) {
        this.online = online;
    }

    public List<ProductCharactor> getProductCharactorSet() {
        return productCharactorSet;
    }

    public void setProductCharactorSet(List<ProductCharactor> productCharactorSet) {
        this.productCharactorSet = productCharactorSet;
    }
}
