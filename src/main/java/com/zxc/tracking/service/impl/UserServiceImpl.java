package com.zxc.tracking.service.impl;

import com.zxc.tracking.model.User.User;
import com.zxc.tracking.repository.UserRepository;
import com.zxc.tracking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUserById(long id) {
        return userRepository.getUserById(id);
    }
}
