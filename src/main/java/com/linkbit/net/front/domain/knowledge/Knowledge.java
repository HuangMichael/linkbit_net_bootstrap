package com.linkbit.net.front.domain.knowledge;

import com.linkbit.net.front.utils.KnowledgeType;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by huangbin on 2016/1/12 0012.
 * 知识库实体类
 */

@Entity
@Table(name = "T_KNOWLEDGE")
@Data
public class Knowledge {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String title; //文章名称
    private String keywords;  //关键字
    private String content; //内容
    private KnowledgeType knowledgeType;//知识库类型
    private String publisher; //发布者
    private Date publishTime;//发布时间
    private Boolean display;//是否显示
    private Boolean showInMainPage;//  是否主页显示
}
