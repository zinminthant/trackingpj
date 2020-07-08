package com.zxc.tracking.service.impl;

import com.zxc.tracking.model.User.Customer;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.repository.CustomerRepository;
import com.zxc.tracking.repository.UserRepository;
import com.zxc.tracking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserRepository userRepository;


    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public User getUserById(long id) {
        return userRepository.getUserById(id);
    }

    @Override
    public Page<Customer> getCustomerByNameandRegion(String name, String code, Pageable pageable) {
        return customerRepository.find(name,code,pageable);
    }
}
