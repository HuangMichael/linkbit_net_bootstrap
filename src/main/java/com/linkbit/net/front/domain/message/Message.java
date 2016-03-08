package com.linkbit.net.front.domain.message;

import jdk.nashorn.internal.objects.annotations.Constructor;
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
    private String userName;
    private String email;
    private String telephone;
    private String workplace;
    private String content;
    @Temporal(TemporalType.TIMESTAMP)
    private Date messageTime;
    private String status;
}
