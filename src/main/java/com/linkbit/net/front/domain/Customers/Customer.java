package com.linkbit.net.front.domain.customers;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 知识库实体类
 */

@Entity
@Table(name = "T_CUSTOMER")
@Data
public class Customer {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String customerName;
    private String logoPath;
    private String address;
    private String telphone;
    private String fax;
    private String mainpage;
    private String masterName;
    private Date beginDate;
    private Boolean showInMainPage;
    private Boolean status;
}
