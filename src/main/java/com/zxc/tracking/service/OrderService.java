package com.zxc.tracking.service;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;
import com.zxc.tracking.model.view.OrderDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {

    Boolean createOrder(Order order);

    Boolean createOrder(OrderDTO orderDTO);

    Page<Order> orderList(Pageable page);


    List<Order> orders();

    List<OrderStatus> getOrderStatusesByOrderId(long orderId);

    Order getOrderById(long id);

    Order getOrderByOrderCode(String orderCode);

    OrderStatus getOrderStatusById(long id);

    OrderStatus updateOrderStatus(OrderStatus orderStatus);

    Boolean updateOrder(Order order);

    Boolean updateSMSStatus(long orderId);
}
