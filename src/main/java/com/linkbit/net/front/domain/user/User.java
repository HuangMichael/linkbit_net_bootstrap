package com.linkbit.net.front.domain.user;

import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2015/12/24 0024.
 */
@Component
public class User {
    private long id;



    private String userName;
    private String password;
    private String status;


    public User() {
    }


    public User(String userName, String password,String status) {
        this.userName = userName;
        this.password = password;
        this.status =status;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
