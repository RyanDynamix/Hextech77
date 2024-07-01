/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hotaru
 */
public class OrderDetails {
    private int orderDetailsID;
    private int productID;
    private int orderID;
    private int numProductBuy;
    private double price;

    public OrderDetails() {
    }

    public OrderDetails(int orderDetailsID, int productID, int orderID, int numProductBuy, double price) {
        this.orderDetailsID = orderDetailsID;
        this.productID = productID;
        this.orderID = orderID;
        this.numProductBuy = numProductBuy;
        this.price = price;
    }

    public int getOrderDetailsID() {
        return orderDetailsID;
    }

    public void setOrderDetailsID(int orderDetailsID) {
        this.orderDetailsID = orderDetailsID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getNumProductBuy() {
        return numProductBuy;
    }

    public void setNumProductBuy(int numProductBuy) {
        this.numProductBuy = numProductBuy;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderDetailsID=" + orderDetailsID + ", productID=" + productID + ", orderID=" + orderID + ", numProductBuy=" + numProductBuy + ", price=" + price + '}';
    }
    
    
}
