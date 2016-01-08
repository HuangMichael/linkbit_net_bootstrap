package com.linkbit.net.front.domain.service.customer;


import com.linkbit.net.front.domain.customer.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/12/23 0023.
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public void create() {
        customerRepository.create();
        System.out.println("this is the method from " + this.getClass().getSimpleName());
    }
}
