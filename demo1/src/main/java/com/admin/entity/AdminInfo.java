package com.admin.entity;

public class AdminInfo {

    private Integer admin_id;
    private String account;
    private String password;
    private Integer admin_type;


    public Integer getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(Integer admin_id) {this.admin_id = admin_id;}

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAdmin_type() {
        return admin_type;
    }

    public void setAdmin_type(Integer admin_type) {
        this.admin_type = admin_type;
    }

    @Override
    public String toString() {
        return "AdminInfo{" +
                "admin_id=" + admin_id + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", admin_type=" + admin_type + '\'' +
                '}';
    }



}




