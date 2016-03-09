package com.linkbit.net.front.domain.user;

import com.linkbit.net.front.domain.role.Role;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by huangbin on 2015/12/24 0024.
 */
@Entity
@Table(name = "T_USER")
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
    private String email;//电子邮箱
    @Temporal(TemporalType.DATE)
    private Date birthday;//出生日期
    private String status;//用户状态

    @ManyToMany(cascade = CascadeType.ALL, targetEntity = com.linkbit.net.front.domain.role.Role.class)
    @JoinTable(
            name = "t_user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles = new HashSet<Role>();

}
