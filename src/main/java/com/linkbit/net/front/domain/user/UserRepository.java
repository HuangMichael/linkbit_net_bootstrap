package com.linkbit.net.front.service.menu.domain.user;

import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Repository
public class UserRepository {

    /**
     * 创建对象
     */

    public void create() {
        System.out.println("this is the method from " + this.getClass().getSimpleName());
    }
}
