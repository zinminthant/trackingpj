package com.zxc.tracking.model.view;

import com.zxc.tracking.model.Order;
import com.zxc.tracking.model.OrderStatus;

import java.util.List;

public class OrderDTO {

    private Order order;

    private List<OrderStatus> orderStatuses;

    public Order getOrder() {
        return order;
    }

    public OrderDTO() {
    }

    public OrderDTO(Order order, List<OrderStatus> orderStatuses) {
        this.order = order;
        this.orderStatuses = orderStatuses;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderStatus> getOrderStatuses() {
        return orderStatuses;
    }

    public void setOrderStatuses(List<OrderStatus> orderStatuses) {
        this.orderStatuses = orderStatuses;
    }
}
