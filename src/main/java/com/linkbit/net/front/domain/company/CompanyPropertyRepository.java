package com.linkbit.net.front.domain.company;


import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2016/1/13 0013.
 */
public interface CompanyPropertyRepository extends Repository<CompanyProperty,Long>{

    /**
     * 查询所有的公司属性信息
     */
    List<CompanyProperty> findAll();

    /**
     * 根据id查询对应的公司 属性信息
     */
    CompanyProperty findById(Long id);


    /**
     * 保存公司属性信息
     */
    CompanyProperty  save(CompanyProperty companyProperty);
}
