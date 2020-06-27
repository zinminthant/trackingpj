package com.zxc.tracking.rest.controller;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.view.DatatableBean;
import com.zxc.tracking.model.view.OrderView;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.util.TrackingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


@org.springframework.web.bind.annotation.RestController
@RequestMapping("/rest")
public class RestController {

    @Autowired
    private OrderService orderService;


    @Autowired
    private MessageSource messageSource;


    @RequestMapping(value = "/test")
    public String testing() {
        return "Hello World";
    }



//
//    @RequestMapping(value = "/customers", produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Object> customerList() {
//
//        Greeting greeting = new Greeting("Hello World");
//
//        greeting.add(linkTo(methodOn(RestController.class).tesingh()).withSelfRel());
//
//        return new ResponseEntity<>(greeting, HttpStatus.OK);
//
//    }

    @RequestMapping(value = "/orders", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> orderList(HttpServletRequest request) {


        Pageable pageable=TrackingUtil.getPageFromRequest(request);

        System.out.println("====="+pageable);

        Page<Order> orders=orderService.orderList(pageable);

        List<OrderView> orderViewList=new ArrayList<>();

        for(Order order:orders.getContent()){
            OrderView view=new OrderView();
            view.setId(order.getId());
            view.setOrderCode(order.getOrderCode());
            view.setCustomerName(order.getCustomer().getName()+"<br>"+order.getCustomer().getPhone());
            view.setCurrentStatus(TrackingUtil.getCurrentStatus(order.getComplete(),order.getStatusSet()));
            view.setOrderCreatedDate(TrackingUtil.DateToString(order.getStatusSet().get(0).getDate()));

            orderViewList.add(view);
        }



        DatatableBean bean=new DatatableBean();

        bean.setiTotalDisplayRecords((int) (long)orders.getTotalElements());
        bean.setiTotalRecords((int) (long)orders.getTotalElements());
        bean.setAaData(orderViewList);

        return new ResponseEntity<>(bean, HttpStatus.OK);


    }

    @RequestMapping(value = "/testing", produces = MediaType.APPLICATION_JSON_VALUE)
    public String tesingh(@RequestHeader(name = "Accept-Language",required = false)Locale locale) {

        System.out.println(locale);

     return messageSource.getMessage("testing.message",null,locale);

    }

}
