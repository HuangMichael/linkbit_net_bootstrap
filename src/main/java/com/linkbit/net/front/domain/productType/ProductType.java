package com.linkbit.net.front.domain.productType;

/**
 * Created by Administrator on 2016/1/27 0027.
 */

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.linkbit.net.front.domain.product.Product;
import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
@Entity
@Table(name = "T_PRODUCT_TYPE")
@Data
public class ProductType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String typeName;
    private String status; //(0禁用1启用)
    @OneToMany(mappedBy = "productType", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JsonBackReference("productList")
    private List<Product> productList = new ArrayList<Product>();

}
