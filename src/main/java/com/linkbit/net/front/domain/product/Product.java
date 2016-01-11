package com.linkbit.net.front.domain.product;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

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
    private Date onLineDate;
    private boolean online;
}
