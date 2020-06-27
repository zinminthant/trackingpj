package com.zxc.tracking.web.controller;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

    @Autowired
    private OrderService orderService;


    @RequestMapping("/orders")
    public String orderList()
    {  System.out.println("----"+orderService.orders());

    for(Order order:orderService.orders()){
        System.out.println("-------"+order.getCustomer().getName());
    }
        return "/delivery/order_list";
    }

    @RequestMapping("/orders/{id}")
    public String orderDetail(@PathVariable("id")long id)
    {
        Order order=orderService.getOrderById(id);

        List<OrderStatus> before=order.getStatusSet().stream().filter(m->m.getDate()!=null && (m.getDate().compareTo(new Date())<0)).collect(Collectors.toList());

        System.out.println("before---"+before);

        return "/delivery/order_detail";
    }

    @RequestMapping("/profile")
    public String profile(){return "/delivery/profile";}
}
