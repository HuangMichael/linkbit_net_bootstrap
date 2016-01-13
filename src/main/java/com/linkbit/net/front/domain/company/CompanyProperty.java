package com.linkbit.net.front.domain.company;


import lombok.Data;

import javax.persistence.*;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 公司属性实体类
 */

@Entity
@Table(name = "T_COMPANY_PROPERTITY")
@Data
public class CompanyProperty {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title; //属性标题
    private String propertyDesc;  //属性描述
    private String content; //内容
    private Boolean status;//是否显示
    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "company_id", referencedColumnName = "id")//
    private Company company;
}
