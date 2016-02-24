package com.linkbit.net.front.domain.user;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2015/12/24 0024.
 */
@Entity
@Table(name="T_USER")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String userName;//用户名
    private String password;//密码
    private String imgUrl; //头像存放路径
    private String gender; //性别
    private String personName;//姓名
    private String email ;//电子邮箱
    @Temporal(TemporalType.DATE)
    private Date birthday;//出生日期
    private String status;//用户状态

}
