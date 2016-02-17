package com.linkbit.net.front.domain.company;


import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 公司 信息
 */

@Entity
@Table(name = "T_COMPANY")
@Data
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//id
    private String companyName;//公司名称
    private String logoPath;//logo地址
    private String address;//公司地址
    private String longtitude;  //维度
    private String latitude;  //经度
    private String telephone; //  电话
    private String fax;//传真
    private Date buildDate;//成立日期
    private Boolean status;//状态
    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<CompanyProperty> companyPropertyList  = new ArrayList<CompanyProperty>();
}
