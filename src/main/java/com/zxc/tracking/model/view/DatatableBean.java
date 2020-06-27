package com.zxc.tracking.model.view;

import java.io.Serializable;
import java.util.List;

public class DatatableBean implements Serializable {

    private Integer iTotalRecords;

    private Integer iTotalDisplayRecords;

    @SuppressWarnings("rawtypes")
    private List aaData;


    public Integer getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(Integer iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public Integer getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(Integer iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public List getAaData() {
        return aaData;
    }

    public void setAaData(List aaData) {
        this.aaData = aaData;
    }
}
