package com.zxc.tracking.model.Util;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="T_CODE")
@SequenceGenerator(name="tracking_seq", initialValue=9, allocationSize=100)
public class Code implements Serializable {



    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "tracking_seq")
    private long id;

    @JsonIgnore
    @Column(name = "CREATED_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate=new Date();


    @Column(name = "CODE_ID",nullable = false)
    private String codeID;

    @Column(name = "CODE_TYPE",nullable = false)
    private String codeType;

    @Column(name = "CODE_NAME",nullable = false)
    private String codeName;

    @Column(name = "DESCRIPTION",nullable = true)
    private String descriptioon;

    @Column(name = "CODE_ICON",nullable = true)
    private String codeIcon;



    public Code() {
    }

    public Code( String codeID, String codeType, String codeName) {
        this.codeID = codeID;
        this.codeType = codeType;
        this.codeName = codeName;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCodeID() {
        return codeID;
    }

    public void setCodeID(String codeID) {
        this.codeID = codeID;
    }

    public String getCodeType() {
        return codeType;
    }

    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }


    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescriptioon() {
        return descriptioon;
    }

    public void setDescriptioon(String descriptioon) {
        this.descriptioon = descriptioon;
    }

    public String getCodeIcon() {
        return codeIcon;
    }

    public void setCodeIcon(String codeIcon) {
        this.codeIcon = codeIcon;
    }
}


