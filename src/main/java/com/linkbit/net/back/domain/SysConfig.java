package com.linkbit.net.back.domain;

/**
 * Created by Administrator on 2016/2/19 0019.
 */

import lombok.Data;

import javax.persistence.*;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 使用状态
 */

@Entity
@Table(name = "T_SYS_CONFIG")
@Data
public class SysConfig {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//id
    private String paraDesc;//参数描述
    private String paraName;//参数名称
    private String paraValue;//参数值
    private String status;//使用状态


}
