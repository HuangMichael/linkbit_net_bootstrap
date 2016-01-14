package com.linkbit.net.front.service.menu.domain.product;

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
    private String productType;
    private String productDesc;
    private String productImgUrl;
    private Boolean showInMainPage;
    private Long sortNo;
    @Temporal(TemporalType.DATE)
    private Date onLineDate;
    private boolean online;
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ProductCharactor> productCharactorSet = new ArrayList<ProductCharactor>();
}
