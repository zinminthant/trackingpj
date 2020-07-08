package com.zxc.tracking.repository;

import com.zxc.tracking.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long> {

    Order getOrderById(long id);

    Order getOrderByOrderCode(String OrderCode);

    Page<Order> findAll(Pageable pageable);


    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("update Order o set o.sms=TRUE where o.id=:orderId")
    void updateSMSStatus(@Param("orderId")long orderId);
}
