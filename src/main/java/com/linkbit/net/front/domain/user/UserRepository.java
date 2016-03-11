package com.linkbit.net.front.domain.user;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
public interface UserRepository extends CrudRepository<User, Long> {
    /**
     * 查询所有用户
     */
    List<User> findAll();

    /**
     * 根据用户名和密码查询用户
     */
    User findByUserNameAndPassword(String userName, String password);



    /**
     * 根据用户名和密码查询用户
     */
    User findByUserNameAndPasswordAndStatus(String userName, String password, String status);

    /**
     * 根据id查询用户
     */
    User findById(long id);

    /**
     * 删除用户
     */
    void delete(User user);
    /**
     * 账户禁用
     */
   // void disableUser(User user);

}
