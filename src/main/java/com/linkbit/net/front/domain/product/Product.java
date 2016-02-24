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
 * 产品信息
 */
@Entity
@Table(name = "T_PRODUCT")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String productName;  //产品名称
    private String productDesc; //产品描述
    private String productImgUrl; //产品图片路径
    private Boolean showInMainPage;//产品是否显示在首页
    private Long sortNo;//排序
    @Temporal(TemporalType.DATE)
    private Date onLineDate;//产品上线日期
    private boolean online;//产品是否上线
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonBackReference("productCharactorSet")
    private List<ProductCharactor> productCharactorSet = new ArrayList<ProductCharactor>(); //产品属性集合
    @ManyToOne(cascade = CascadeType.REFRESH, optional = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_type_id", referencedColumnName = "id")
    private ProductType productType; //产品类型
}
