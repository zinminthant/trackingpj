package com.zxc.tracking.web.controller;

import com.zxc.tracking.model.Const.Student;
import com.zxc.tracking.repository.RoleRepository;
import com.zxc.tracking.repository.UserRepository;
import com.zxc.tracking.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;

@Controller
public class SetupController {


    @Autowired
    private RoleRepository repository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UniversityService universityservice;


    @RequestMapping("/setup")
    public void jpa(){


        Student student=new Student("first","last","A");
        Student student1=new Student("first1","last1","B");
        com.zxc.tracking.model.Const.University university=new com.zxc.tracking.model.Const.University("name","country");
        university.setStudents(Arrays.asList(student,student1));

            universityservice.save(university);
//       repository.save(new Role("ADMIN"));
//   repository.save(new Role("DELIVERY"));



//        Role admin=repository.getRoleByRole("ADMIN");
//        User adminUser=new User("Admin","09111","admin","admin",admin);
//        Role delivery=repository.getRoleByRole("DELIVERY");
//        User deliveryUser=new User("Delivery","09111","delivery","delivery",delivery);
//
//        userRepository.save(adminUser);
//        userRepository.save(deliveryUser);

    }
}
