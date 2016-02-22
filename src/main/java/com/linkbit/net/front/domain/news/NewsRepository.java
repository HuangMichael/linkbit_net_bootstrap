package com.linkbit.net.front.domain.news;


import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/13 0013.
 */
public interface NewsRepository extends Repository<News, Long> {

    /**
     * 查询所有的新闻信息
     */
    List<News> findAll();

    /**
     * 根据id查询对应的新闻信息
     */
    News findById(Long id);


    /**
     * 保存新闻信息
     */
    News save(News news);
}
