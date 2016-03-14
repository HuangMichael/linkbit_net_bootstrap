package com.linkbit.net.front.domain.knowledge;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/12 0012.
 */
public interface KnowledgeRepository extends Repository<Knowledge, Long> {

    /**
     * 查询首页中显示的信息
     */
    List<Knowledge> findByShowInMainPage(Boolean showInMainPage);

    /**
     * 查询所有的知识库信息
     */
    @Query("select k  from Knowledge k order by  k.publishTime desc")
    List<Knowledge> findAll();

    /**
     * 根据id查询对应的知识信息
     */
    Knowledge findById(Long id);

    /**
     * 删除实体信息
     */

    void delete(Knowledge knowledge);

    /**
     * 保存实体信息
     */

    Knowledge save(Knowledge knowledge);
}
