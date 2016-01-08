package com.linkbit.net.front.domain.customer;

import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Repository
public class CustomerRepository {

    /**
     * 创建对象
     */

    public void create() {
        System.out.println("this is the method from " + this.getClass().getSimpleName());
    }
}
