package com.linkbit.net.back.domain;

/**
 * Created by Administrator on 2016/2/19 0019.
 */

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 访问日志
 */

@Entity
@Table(name = "T_APP_ACCESS_LOG")
@Data
public class AppAccessLog {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;//id
    private String appName;
    private String clientIp;//客户端ip
    private Date accessTime;//访问日期


}
