package com.zxc.tracking.web.controller;


import com.zxc.tracking.model.Const.Message;
import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.model.User.Customer;
import com.zxc.tracking.model.Util.Code;
import com.zxc.tracking.model.User.User;
import com.zxc.tracking.model.view.OrderView;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.service.SettingService;
import com.zxc.tracking.util.CodeGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private SettingService settingService;

    @Autowired
    private CodeGenerator codeGenerator;

    @Autowired
    private OrderService orderService;



    @Value("#{'${select.code}'.split(',')}")
    private List<String> myList;

    @Value("#{'${status.code}'.split(',')}")
    private List<String> statusList;


    @RequestMapping("/createorder")
    public String createOrderGet(Model model){


        model.addAttribute("orderId",codeGenerator.randomUUID(5,0,'T'));
        model.addAttribute("order",new Order());
        model.addAttribute("regionList",settingService.findCodesByType("REGION"));
            model.addAttribute("deliveryList",settingService.deliveryList());


        return "/admin/order_create";
    }


    @RequestMapping(value = "/createorder",method = RequestMethod.POST)
    public String CreateOrder(@ModelAttribute("order")Order order){
     Collections.sort(order.getStatusSet(),Comparator.comparing(OrderStatus::getDate));
        if(order.getStatusSet().size()==3){
            for(int i=0;i<3;i++){
                order.getStatusSet().get(i).setCode(settingService.getCodeByCodeId(statusList.get(i)));
                order.getStatusSet().get(i).setOrder(order);
            }

        }
        order.getStatusSet().add(new OrderStatus(settingService.getCodeByCodeId(statusList.get(3)),order,null));

        orderService.createOrder(order);

        return "redirect:/main";
    }


    @RequestMapping(value = "/updateOrder",method = RequestMethod.POST)
    public String UpdateOrder(@ModelAttribute("order")Order order){

        Collections.sort(order.getStatusSet(),Comparator.comparing(OrderStatus::getDate,Comparator.nullsLast(Comparator.naturalOrder())));

            for(int i=0;i<4;i++){
                order.getStatusSet().get(i).setCode(settingService.getCodeByCodeId(statusList.get(i)));
                order.getStatusSet().get(i).setOrder(order);
            }



        orderService.createOrder(order);

        return "redirect:/main";
    }




    @RequestMapping("/orders/{id}")
    public String orderDetail(Model model, @PathVariable("id")long id){



        Order order=orderService.getOrderById(id);


        List<OrderStatus> statuses=order.getStatusSet().stream().sorted(Comparator.comparing(OrderStatus::getDate,Comparator.nullsLast(Comparator.nullsLast(Comparator.naturalOrder())))).collect(Collectors.toList());

        order.setStatusSet(statuses);


        model.addAttribute("order",order);
        model.addAttribute("regionList",settingService.findCodesByType("REGION"));
        model.addAttribute("deliveryList",settingService.deliveryList());
        return "/admin/order_detail";
    }

    @RequestMapping("/setting")
    public String codeList(Model model){
       model.addAttribute("list",myList);
        model.addAttribute("code",new Code());
        return "admin/setting";
    }

    @RequestMapping("/message")
    public String message(Model model){

        model.addAttribute("message",(settingService.getMessage("EN")!=null)?settingService.getMessage("EN"):new Message());
        return "admin/message";
    }

    @RequestMapping(value = "/savemessage",method = RequestMethod.POST)
    public String saveMessage(@ModelAttribute("message")Message message){

        settingService.createMessageFormat(message);

        return "redirect:/admin/message";
    }


    @RequestMapping(value = "/saveCode",method = RequestMethod.POST)
    public String saveCode(){


    System.out.println("fwefwef");
return "";
    }





    @RequestMapping("/customers")
    public String customerList(Model model){
        model.addAttribute("codes",settingService.findCodesByType("REGION"));
        return "/admin/customer_list";
    }


    @RequestMapping("/customers/detail")
    public String customerDetail(){
        return "/admin/customer_detail";
    }





    @RequestMapping("/profile")
    public String profile(Model model){
        model.addAttribute("user",new User());
        return "/admin/profile";
    }

    @RequestMapping("/order")
    public String order(Model model){

        return "/admin/order";
    }



    @RequestMapping(value = "/saveUser",method = RequestMethod.POST,headers = {"Accept=application/json"})
    public ResponseEntity<Object> updateUser(@ModelAttribute("user")User user,MultipartHttpServletRequest request){
        System.out.println(user);
        return new ResponseEntity<>("",HttpStatus.OK);
    }


    @RequestMapping(value = "/test")
    public String test(){

        System.out.println(codeGenerator.randomUUID(9,0,'A'));
        System.out.println(codeGenerator.randomUUID(9,1,'C'));
     return "/common/test";
    }


}
