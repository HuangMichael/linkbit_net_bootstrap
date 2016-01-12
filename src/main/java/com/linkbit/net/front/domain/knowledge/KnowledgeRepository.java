package com.linkbit.net.front.domain.knowledge;

import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/1/12 0012.
 */
public interface KnowledgeRepository extends Repository<Knowledge, Long> {

    /**
     * 查询首页中显示的信息
     */

    List<Knowledge> findByShowInMainPage(Boolean showInMainPage);

    /**
     * 查询所有的知识库信息
     */
    List<Knowledge> findAll();
}
