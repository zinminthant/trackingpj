package com.zxc.tracking.service.impl;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.model.view.OrderDTO;
import com.zxc.tracking.repository.OrderRepository;
import com.zxc.tracking.repository.OrderStatusRepository;
import com.zxc.tracking.service.OrderService;
import com.zxc.tracking.service.SettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderRepository orderRepository;


    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private SettingService settingService;

    @Value("#{'${status.code}'.split(',')}")
    private List<String> statusList;





    @Override
    public Boolean createOrder(Order order) {
        orderRepository.save(order);
       return true;
    }

    @Override
    public Boolean createOrder(OrderDTO orderDTO) {
//        Order order=orderRepository.save(orderDTO.getOrder());
//
//        Collections.sort(orderDTO.getOrderStatuses(),Comparator.comparing(OrderStatus::getDate,Comparator.nullsLast(Comparator.naturalOrder())));
//
//        if(orderDTO.getOrderStatuses().size()==3){
//            for(int i=0;i<3;i++){
//                orderDTO.getOrderStatuses().get(i).setCode(settingService.getCodeByCodeId(statusList.get(i)));
//                orderDTO.getOrderStatuses().get(i).setOrderId(order.getId());
//
//                orderStatusRepository.save(orderDTO.getOrderStatuses().get(i));
//            }
//            orderStatusRepository.save(new OrderStatus(settingService.getCodeByCodeId(statusList.get(3)),null,order.getId()));
//
//
//        }

        return Boolean.TRUE;
    }

    @Override
    public Page<Order> orderList(Pageable page) {
        return orderRepository.findAll(page);
    }

    @Override
    public List<Order> orders() {
        return orderRepository.findAll();
    }

    @Override
    public List<OrderStatus> getOrderStatusesByOrderId(long orderId) {
        return orderStatusRepository.findAllByOrderId(orderId);
    }

    @Override
    public Order getOrderById(long id) {
        return orderRepository.getOrderById(id);
    }

    @Override
    public Order getOrderByOrderCode(String orderCode) {
        return orderRepository.getOrderByOrderCode(orderCode);
    }

    @Override
    public OrderStatus getOrderStatusById(long id) {
        return orderStatusRepository.getOrderStatusById(id);
    }

    @Override
    public OrderStatus updateOrderStatus(OrderStatus orderStatus) {
        return orderStatusRepository.save(orderStatus);
    }

    @Transactional
    @Override
    public Boolean updateOrder(Order order) {


        return true;
    }

    @Override
    public Boolean updateSMSStatus(long orderId) {
       try{

           System.out.println("----"+orderId);
           orderRepository.updateSMSStatus(orderId);
           return true;
       }catch (Exception e){
           return false;
       }
    }
}
