package com.zxc.tracking.model.User;


import javax.persistence.*;

@Entity
@Table(name = "T_ROLE")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;

    @Column(name = "ROLE",nullable = false)
    private String role;


    public Role() {
    }

    public Role(String role) {
        this.role = role;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
