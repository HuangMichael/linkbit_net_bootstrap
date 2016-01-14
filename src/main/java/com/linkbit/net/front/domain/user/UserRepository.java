package com.linkbit.net.front.domain.user;

import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
public interface UserRepository extends Repository<User, Long> {

    List<User> findAll();

}
