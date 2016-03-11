package com.linkbit.net.front.domain.message;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2015/12/23 0023.
 * 留言
 */
@Entity
@Table(name = "T_MESSAGE")
@Data
@Setter
@Getter
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(length = 20, nullable = true)
    private String userName;
    @Column(length = 20, nullable = true)
    private String email;
    @Column(length = 20, nullable = true)
    private String telephone;
    @Column(length = 50, nullable = true)
    private String workplace;
    @Column(length = 200, nullable = true)
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    private Date messageTime;
    @Column(length = 1, nullable = false)
    private String status;
}
