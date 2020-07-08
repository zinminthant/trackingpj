package com.zxc.tracking.model.Const;


import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;

@Entity
@Table(name = "T_MESSAGE")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;

    @Column(name = "TYPE")
    private String type="EN";

    @Column(name = "TEXT_MESSAGE")
    private String textMessage;

    public Message() {
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTextMessage() {
        return textMessage;
    }

    public void setTextMessage(String textMessage) {
        this.textMessage = textMessage;
    }
}
