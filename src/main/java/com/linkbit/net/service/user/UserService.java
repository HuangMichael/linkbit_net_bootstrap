package com.linkbit.net.service.user;


import com.linkbit.net.domain.user.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Service
public interface UserService {

    /**
     * 创建对象
     */
    void create();


    /**
     * 删除用户
     */
    void delete(long id);

    /**
     * 创建对象
     */
    List<User> findAllUsers();
}
