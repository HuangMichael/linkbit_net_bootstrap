package com.linkbit.net.front.domain.company;


import lombok.*;
import lombok.extern.log4j.Log4j;

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
@Setter
@Getter
@Log4j
@NoArgsConstructor
@AllArgsConstructor
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//id
    @Column(length = 50,nullable = false)
    private String companyName;//公司名称
    @Column(length = 50)
    private String logoPath;//logo地址
    @Column(length = 100,nullable = false)
    private String address;//公司地址
    @Column(length = 10)
    private String longtitude;  //维度
    @Column(length = 10)
    private String latitude;  //经度
    @Column(length = 12)
    private String telephone; //  电话
    @Column(length = 12)
    private String fax;//传真
    private Date buildDate;//成立日期
    @Column(length = 1,nullable = false)
    private Boolean status;//状态
    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<CompanyProperty> companyPropertyList  = new ArrayList<CompanyProperty>();
}
