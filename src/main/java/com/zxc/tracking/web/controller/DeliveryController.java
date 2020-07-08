package com.zxc.tracking.web.controller;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.util.TrackingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Comparator;
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
    public String orderDetail(@PathVariable("id")long id,Model model)
    {
      Order order=orderService.getOrderById(id);


      List<OrderStatus> before=TrackingUtil.Before(order.getStatusSet());
        Collections.sort(before,Comparator.comparing(OrderStatus::getDate));

        List<OrderStatus> after=TrackingUtil.AfterWithoutNull(order.getStatusSet());
        Collections.sort(after,Comparator.comparing(OrderStatus::getDate));


        model.addAttribute("order",order);
        model.addAttribute("before",before);
       model.addAttribute("after",after);

      OrderStatus complete=TrackingUtil.CompleteStatus(order.getStatusSet());

      System.out.println("complete"+complete);
      System.out.println("before"+TrackingUtil.Before(order.getStatusSet()));
      model.addAttribute("complete",complete);
        return "/delivery/order_detail";
    }

    @RequestMapping("/order/update")
    public String orderDetail(@ModelAttribute("complete")OrderStatus orderStatus)

    {


       OrderStatus status=orderService.getOrderStatusById(orderStatus.getId());

       Order order=orderService.getOrderById(status.getOrder().getId());
       for(OrderStatus ostatus:order.getStatusSet()){
           System.out.println(ostatus.getDate());
           if(ostatus.getDate()!=null && (ostatus.getDate().compareTo(new Date())>=0)){
               ostatus.setDate(new Date(System.currentTimeMillis()-(5*60000)));
               orderService.updateOrderStatus(ostatus);
           }
       }

       status.setDate(orderStatus.getDate());

      orderService.updateOrderStatus(status);

        return "redirect:/delivery/orders/"+status.getOrder().getId();
    }

    @RequestMapping("/profile")
    public String profile(){return "/delivery/profile";}
}
