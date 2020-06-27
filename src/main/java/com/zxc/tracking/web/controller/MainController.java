package com.zxc.tracking.web.controller;

import com.zxc.tracking.model.User.Role;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {





    @RequestMapping("/main")
    public String main(HttpServletRequest request){

       if(request.isUserInRole("ADMIN")){
           return "/admin/order_list";
       }

       return "/delivery/order_list";

    }


    @RequestMapping("/login")
    public String login(){

        return "hello";
    }


}
