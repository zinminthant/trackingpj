package com.zxc.tracking.repository;

import com.zxc.tracking.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order,Long> {

    Order getOrderById(long id);

    Order getOrderByOrderCode(String OrderCode);

    Page<Order> findAll(Pageable pageable);
}
