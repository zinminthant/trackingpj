package com.zxc.tracking.repository;

import com.zxc.tracking.model.User.Customer;
import org.hibernate.criterion.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Long> {

    Page<Customer> findAll(Pageable pageable);

    Page<Customer> findAllByNameLikeAndRegionCodeOrderByIdDesc(String name,String regionCode,Pageable pageable);



    @Transactional
    @Query("select c from Customer c where (:name is null or lower(c.name) like %:name%) and (:region is null or c.regionCode=:region) order by c.id desc ")
    Page<Customer> find(@Param("name")String name,@Param("region")String region,Pageable pageable);


}
