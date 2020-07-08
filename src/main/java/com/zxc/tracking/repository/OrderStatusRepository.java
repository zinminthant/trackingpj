package com.zxc.tracking.repository;

import com.zxc.tracking.model.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderStatusRepository extends JpaRepository<OrderStatus,Long> {

    OrderStatus getOrderStatusById(long id);

    List<OrderStatus> findAllByOrderId(long orderId);

}
