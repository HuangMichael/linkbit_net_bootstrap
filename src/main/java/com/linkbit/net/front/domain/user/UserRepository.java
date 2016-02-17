package com.linkbit.net.front.domain.user;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
public interface UserRepository extends CrudRepository<User, Long> {

    List<User> findAll();

    User  findByUserNameAndPassword(String userName,String password);

}
