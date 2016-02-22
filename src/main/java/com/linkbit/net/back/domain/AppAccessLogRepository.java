package com.linkbit.net.back.domain;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2016/2/19 0019.
 */
public interface AppAccessLogRepository extends CrudRepository <AppAccessLog,Long>{




    @Query("SELECT l.appName FROM AppAccessLog l")
     List<String> findLast5DaysAccess();





}
