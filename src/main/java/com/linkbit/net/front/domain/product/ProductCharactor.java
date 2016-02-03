package com.linkbit.net.front.domain.product;

import lombok.Data;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/1/11 0011.
 */
@Entity
@Table(name = "T_PRODUCT_CHARACTOR")
@Data
public class ProductCharactor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String charactorDesc;
    @ManyToOne(cascade = CascadeType.ALL, optional = true,fetch = FetchType.LAZY)
    @JoinColumn(name="product_id", referencedColumnName="id")//
    private Product product;
    private boolean status;
/*

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCharactorDesc() {
        return charactorDesc;
    }

    public void setCharactorDesc(String charactorDesc) {
        this.charactorDesc = charactorDesc;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }*/
}
