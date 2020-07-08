package com.zxc.tracking.model.view;

public class CustomerView {

    private long id;

    private String name;

    private String phone;

    private String region;

    private String regionCode;

    public CustomerView() {
    }

    public CustomerView(long id, String name, String phone, String region,String regionCode) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.region = region;
        this.regionCode=regionCode;
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

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }
}
