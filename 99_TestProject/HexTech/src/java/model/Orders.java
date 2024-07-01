/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author hotaru
 */
public class Orders {
    private int orderID;
    private int totalMoney;
    private boolean status;
    private Date order_Date;
    private String note;
    private String address;
    private int phone;
    private String email;
    private int userID;
    private String fullName;

    public Orders() {
    }

    public Orders(int orderID, int totalMoney, boolean status, Date order_Date, String note, String address, int phone, String email, int userID, String fullName) {
        this.orderID = orderID;
        this.totalMoney = totalMoney;
        this.status = status;
        this.order_Date = order_Date;
        this.note = note;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.userID = userID;
        this.fullName = fullName;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getOrder_Date() {
        return order_Date;
    }

    public void setOrder_Date(Date order_Date) {
        this.order_Date = order_Date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "Orders{" + "orderID=" + orderID + ", totalMoney=" + totalMoney + ", status=" + status + ", order_Date=" + order_Date + ", note=" + note + ", address=" + address + ", phone=" + phone + ", email=" + email + ", userID=" + userID + ", fullName=" + fullName + '}';
    }
    
}
