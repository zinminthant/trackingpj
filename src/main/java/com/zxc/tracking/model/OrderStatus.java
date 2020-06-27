package com.zxc.tracking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zxc.tracking.model.Util.Code;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "T_ORDERSTATUS")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class OrderStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;


    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "STATUS",referencedColumnName = "CODE_ID")
    private Code code;

    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm aa")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "DATE")
    private Date date;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_ID",referencedColumnName = "ID")
    private Order order;

    public OrderStatus() {
    }

    public OrderStatus(Code code) {
        this.code = code;
    }


    public OrderStatus(Code code, Date date) {
        this.code = code;
        this.date = date;
    }

    public OrderStatus(Code code, Order order,Date date) {
        this.code = code;
        this.order = order;
        this.date=date;
    }

    public Code getCode() {
        return code;
    }

    public void setCode(Code code) {
        this.code = code;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }



    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }


    @Override
    public String toString() {
        return "OrderStatus{" +
                "id=" + id +
                ", code=" + code +
                ", date=" + date +
                ", order=" + order +
                '}';
    }
}
