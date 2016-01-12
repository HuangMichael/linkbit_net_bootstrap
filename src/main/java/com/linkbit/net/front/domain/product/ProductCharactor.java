package com.linkbit.net.front.domain.product;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/1/11 0011.
 */
@Entity
@Table(name = "T_PRODUCTCHARACTOR")
@Data
public class ProductCharactor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String charactorDesc;
    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name="product_id", referencedColumnName="id")//
    private Product product;




}
