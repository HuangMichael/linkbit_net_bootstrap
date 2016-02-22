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
    private String knowledgeDesc;  //摘要
    private String content; //内容
    private KnowledgeType knowledgeType;//知识库类型
    private String publisher; //发布者
    @Temporal(TemporalType.DATE)
    private Date publishTime;//发布时间
    private Boolean display;//是否显示
    private Boolean showInMainPage;//  是否主页显示


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getKnowledgeDesc() {
        return knowledgeDesc;
    }

    public void setKnowledgeDesc(String knowledgeDesc) {
        this.knowledgeDesc = knowledgeDesc;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public KnowledgeType getKnowledgeType() {
        return knowledgeType;
    }

    public void setKnowledgeType(KnowledgeType knowledgeType) {
        this.knowledgeType = knowledgeType;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Boolean getDisplay() {
        return display;
    }

    public void setDisplay(Boolean display) {
        this.display = display;
    }

    public Boolean getShowInMainPage() {
        return showInMainPage;
    }

    public void setShowInMainPage(Boolean showInMainPage) {
        this.showInMainPage = showInMainPage;
    }
}
