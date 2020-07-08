package com.zxc.tracking.model.User;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zxc.tracking.model.Order;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "T_CUSTOMER")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "PHONE")
    private String phone;

    @NotNull
    @Column(name = "REGION_CODE")
    private String regionCode;

    @Column(name = "ADDRESS")
    private String address;


    @JsonIgnore
    @OneToOne(mappedBy = "customer",fetch = FetchType.LAZY)
    private Order order;




    public Customer() {
    }

    public Customer(String name, String phone, @NotNull String regionCode, String address) {
        this.name = name;
        this.phone = phone;
        this.regionCode = regionCode;
        this.address = address;

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }


}


