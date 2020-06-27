package com.zxc.tracking.service;

import com.zxc.tracking.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {

    Boolean createOrder(Order order);

    Page<Order> orderList(Pageable page);


    List<Order> orders();

    Order getOrderById(long id);

    Order getOrderByOrderCode(String orderCode);
}
