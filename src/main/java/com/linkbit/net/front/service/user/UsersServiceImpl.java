package com.linkbit.net.front.service.user;


import com.linkbit.net.front.domain.user.User;
import com.linkbit.net.front.domain.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangbin on 2015/12/23 0023.
 */
@Service
public class UsersServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public void create() {

    }

    @Override
    public List<User> findAllUsers() {
        List<User> usersList = new ArrayList<User>();
        for (int i = 0; i < 5; i++) {
            User user = new User("admin" + i, "admin" + i, "1");
            usersList.add(user);
        }

        return usersList;
    }


    @Override
    public void delete(long id) {
        System.out.println("--------------------delete user id :" + id);

    }
}
