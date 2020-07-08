package com.zxc.tracking.rest.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.zxc.tracking.connectionhandler.ApiConnectionHandler;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.service.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zxc.tracking.model.Order;


import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/sms")
public class SMSController {


    @Autowired
    private OrderService orderService;

    @Autowired
    private SettingService settingService;

    @Autowired
    private ApiConnectionHandler apiConnectionHandler;


    @RequestMapping("/sendSMS")
    public ResponseEntity<Object> sendSMS(HttpServletRequest request) throws JsonProcessingException {


        String message=settingService.getMessage("EN").getTextMessage();

        Order order=orderService.getOrderById(Long.parseLong(request.getParameter("id")));

            String textMessage=message.replace("URL","https://www.121tracking.com/"+order.getOrderCode()+"");

            System.out.println(textMessage);


        Map<String, Object> map = new HashMap<>();
        map.put("to", order.getCustomer().getPhone());
        map.put("message",textMessage);
        map.put("sender", "121");
//        map.put("test",1);




        ObjectMapper objectMapper = new ObjectMapper();

       ResponseEntity<String> result = apiConnectionHandler.Post(objectMapper.writeValueAsString(map));


    System.out.println(result);

    orderService.updateSMSStatus(order.getId());

   //System.out.println(result.getBody());
        return new ResponseEntity<>("success",HttpStatus.OK);
    }
}
