package com.linkbit.net.domain.customer;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Component
public class Customer {
    private String userName;
    private Date loginTime;


    public Customer() {
    }

    public Customer(String userName, Date loginTime) {
        this.userName = userName;
        this.loginTime = loginTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }
}
