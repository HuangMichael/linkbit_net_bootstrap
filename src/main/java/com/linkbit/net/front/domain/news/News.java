package com.linkbit.net.front.domain.news;


import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 知识库实体类
 */

@Entity
@Table(name = "T_NEWS")
@Data
public class News {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String newsTitle;
    private String newsDesc;
    private String imgUrl;
    private String newsContent;
    @Temporal(TemporalType.DATE)
    private Date publishTime;
    private String keywords;
    private Boolean status;
}
