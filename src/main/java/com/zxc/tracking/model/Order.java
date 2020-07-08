package com.zxc.tracking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zxc.tracking.model.User.Customer;
import com.zxc.tracking.model.User.User;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
@Entity
@Table(name = "T_ORDER  ")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;

    @NotNull
    @Column(name = "ORDER_CODE")
    private String orderCode;


    @Column(name = "IS_COMPLETE")
    private Boolean isComplete=Boolean.FALSE;

    @Column(name = "SMS")
    private Boolean sms=Boolean.FALSE;


    @Column(name = "REMARK")
    private String remark;

//    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd@HH:mm:ss.SSSZ")
//    @Column(name = "CREATED_DATE")
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date createdDate=new Date();
//
//    @Column(name = "COMPLETE_DATE")
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date completeDate=new Date();
//
//    @NotNull
//    @Column(name = "CURRENT_STATUS_CODE")
//    private String currentStatusCode;

    @NotNull
    @Column(name = "DELIVERY_ID")
    private long delivery;



    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "CUSTOMER",referencedColumnName = "ID")
    private Customer customer;

   @OneToMany(mappedBy = "order",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<OrderStatus> statusSet;

    public Order() {
    }

    public Order(List<OrderStatus> statusSet) {
        this.statusSet = statusSet;
    }

    //    @OneToMany(mappedBy = "product",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
//    private Set<Product> products;


    public Order(@NotNull String orderCode, @NotNull long delivery, Customer customer, List<OrderStatus> statusSet) {
        this.orderCode = orderCode;
        this.delivery = delivery;
        this.customer = customer;
        this.statusSet = statusSet;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }


    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<OrderStatus> getStatusSet() {
        return statusSet;
    }

    public void setStatusSet(List<OrderStatus> statusSet) {
        this.statusSet = statusSet;
    }

    public long getDelivery() {
        return delivery;
    }

    public void setDelivery(long delivery) {
        this.delivery = delivery;
    }

    public Boolean getComplete() {
        return isComplete;
    }

    public void setComplete(Boolean complete) {
        isComplete = complete;
    }


    public Boolean getSms() {
        return sms;
    }

    public void setSms(Boolean sms) {
        this.sms = sms;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
