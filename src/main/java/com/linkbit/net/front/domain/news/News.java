package com.linkbit.net.front.domain.news;


import lombok.*;
import lombok.extern.log4j.Log4j;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 知识库实体类
 */

@Entity
@Table(name = "T_NEWS")

@Data
@Log4j
@NoArgsConstructor
@AllArgsConstructor
public  class News {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String newsTitle;
    private String newsDesc;
    private @Getter @Setter String imgUrl;
    @Column(columnDefinition = "LONGTEXT")
    private String newsContent;
    @Temporal(TemporalType.TIMESTAMP)
    private Date publishTime;
    private String keywords;
    private String status;
}
