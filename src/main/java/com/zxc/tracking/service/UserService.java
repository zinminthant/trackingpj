package com.zxc.tracking.service;

import com.zxc.tracking.model.User.Customer;
import com.zxc.tracking.model.User.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface UserService {

    User getUserById(long id);


    Page<Customer> getCustomerByNameandRegion(String name, String code, Pageable pageable);
}
