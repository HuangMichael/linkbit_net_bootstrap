package com.linkbit.net.front.domain.product;

import lombok.*;

import javax.persistence.*;

/**
 * Created by huangbin on 2016/1/11 0011.
 */
@Entity
@Table(name = "T_PRODUCT_CHARACTOR")
@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ProductCharactor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String charactorName;
    private String charactorDesc;
    @ManyToOne(cascade = CascadeType.ALL, optional = true,fetch = FetchType.LAZY)
    @JoinColumn(name="product_id", referencedColumnName="id")//
    private Product product;
    private boolean status;
}
