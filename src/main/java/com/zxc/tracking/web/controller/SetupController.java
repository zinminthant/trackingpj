package com.zxc.tracking.web.controller;

import com.zxc.tracking.model.User.Role;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.repository.RoleRepository;
import com.zxc.tracking.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SetupController {


    @Autowired
    private RoleRepository repository;

    @Autowired
    private UserRepository userRepository;


    @RequestMapping("/setup")
    public void jpa(){

//       repository.save(new Role("ADMIN"));
//   repository.save(new Role("DELIVERY"));


        Role admin=repository.getRoleByRole("ADMIN");
        User adminUser=new User("Admin","09111","admin","admin",admin);
        Role delivery=repository.getRoleByRole("DELIVERY");
        User deliveryUser=new User("Delivery","09111","delivery","delivery",delivery);

        userRepository.save(adminUser);
        userRepository.save(deliveryUser);

    }
}
