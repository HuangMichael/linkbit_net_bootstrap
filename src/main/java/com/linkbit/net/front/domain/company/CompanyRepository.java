package com.linkbit.net.front.domain.company;

import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/1/13 0013.
 */
public interface CompanyRepository extends Repository<Company, Long> {
    /**
     * 查询所有的公司信息
     */
    List<Company> findAll();

    /**
     * 根据id查询对应的公司信息
     */
    Company findById(Long id);
}
