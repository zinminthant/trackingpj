package com.zxc.tracking.model;


import javax.persistence.*;

@Entity
@Table(name = "T_PRODUCT")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;


    @Column(name = "NAME")
    private String name;

    @ManyToOne
    @JoinColumn(name = "ORDER_ID",referencedColumnName = "ID",nullable = false)
    private Order order;
}
