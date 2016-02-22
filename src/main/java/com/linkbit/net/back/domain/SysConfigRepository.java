package com.linkbit.net.back.domain;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/2/22 0022.
 */
public interface SysConfigRepository extends CrudRepository<SysConfig,Long > {

    List<SysConfig> findAll();

    SysConfig save(SysConfig sysConfig);


    SysConfig findById(long id);


    void delete(SysConfig sysConfig);
}
