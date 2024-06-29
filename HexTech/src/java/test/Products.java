/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.*;
/**
 *
 * @author hotaru
 */
public class Products {
    private int productID;
    private String title;
    private String desc;
    private double price;
    private double discount;
    private Date date_create;
    private Date date_updated;
    private int category;
    private String thumbnail;

    public int getProductID() {
        return productID;
    }

    public Products() {
    }

    public Products(int productID, String title, String desc, double price, double discount, Date date_create, Date date_updated, int category, String thumbnail) {
        this.productID = productID;
        this.title = title;
        this.desc = desc;
        this.price = price;
        this.discount = discount;
        this.date_create = date_create;
        this.date_updated = date_updated;
        this.category = category;
        this.thumbnail = thumbnail;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getDate_create() {
        return date_create;
    }

    public void setDate_create(Date date_create) {
        this.date_create = date_create;
    }

    public Date getDate_updated() {
        return date_updated;
    }

    public void setDate_updated(Date date_updated) {
        this.date_updated = date_updated;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", title=" + title + ", desc=" + desc + ", price=" + price + ", discount=" + discount + ", date_create=" + date_create + ", date_updated=" + date_updated + ", category=" + category + ", thumbnail=" + thumbnail + '}';
    }
    
    
}
