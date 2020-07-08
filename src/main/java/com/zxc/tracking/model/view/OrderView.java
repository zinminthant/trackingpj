package com.zxc.tracking.model.view;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class OrderView {


    private long id;

    private String orderCode;

    private String customerName;

    private String customerPhone;

    private String customerRegionCode;

    private String customerAddress;

    private String customerRemark;

    private String currentStatus;

    private String orderCreatedDate;

    private long deliveryId;

    private Boolean sms;


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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerRegionCode() {
        return customerRegionCode;
    }

    public void setCustomerRegionCode(String customerRegionCode) {
        this.customerRegionCode = customerRegionCode;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerRemark() {
        return customerRemark;
    }

    public void setCustomerRemark(String customerRemark) {
        this.customerRemark = customerRemark;
    }

    public String getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(String currentStatus) {
        this.currentStatus = currentStatus;
    }

    public long getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(long deliveryId) {
        this.deliveryId = deliveryId;
    }

    public String getOrderCreatedDate() {
        return orderCreatedDate;
    }

    public void setOrderCreatedDate(String orderCreatedDate) {
        this.orderCreatedDate = orderCreatedDate;
    }

    public Boolean getSms() {
        return sms;
    }

    public void setSms(Boolean sms) {
        this.sms = sms;
    }
}
