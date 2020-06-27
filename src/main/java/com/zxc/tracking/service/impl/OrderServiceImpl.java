package com.zxc.tracking.service.impl;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.repository.OrderRepository;
import com.zxc.tracking.repository.OrderStatusRepository;
import com.zxc.tracking.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderRepository orderRepository;


    @Autowired
    private OrderStatusRepository orderStatusRepository;





    @Override
    public Boolean createOrder(Order order) {
        orderRepository.save(order);
       return true;
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
    public Order getOrderById(long id) {
        return orderRepository.getOrderById(id);
    }

    @Override
    public Order getOrderByOrderCode(String orderCode) {
        return orderRepository.getOrderByOrderCode(orderCode);
    }
}
