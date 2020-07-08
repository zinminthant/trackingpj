package com.zxc.tracking.web.controller;


import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller

public class CustomerControlller {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;


    @RequestMapping("/{code}")
    public String tracking(@PathVariable("code")String code,Model model){
        Order order=orderService.getOrderByOrderCode(code);

        System.out.println(order.getStatusSet());

        List<OrderStatus> before=order.getStatusSet().stream().filter(m->m.getDate()!=null && (m.getDate().compareTo(new Date())<0)).collect(Collectors.toList());
        List<OrderStatus> after=order.getStatusSet().stream().filter(m->m.getDate()==null || (m.getDate()!=null && (m.getDate().compareTo(new Date())>=0))).collect(Collectors.toList());

        Collections.sort(before,Comparator.comparing(OrderStatus::getDate));
        Collections.sort(after,Comparator.comparing(OrderStatus::getDate));

        model.addAttribute("order",order);
        model.addAttribute("delivery",userService.getUserById(order.getDelivery()));
        model.addAttribute("before",before);
        model.addAttribute("after",after);

        return "/customer/tracking_status";
    }
}
