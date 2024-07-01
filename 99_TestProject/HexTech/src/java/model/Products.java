
package model;

import java.sql.*;

public class Products {

    private int productID;
    private String title;
    private String desc;
    private double price;
    private double discount;
    private Date date_create;
    private Date date_updated;
    private int categoryid;
    private String thumbnail;
    private int quantity;

    public Products() {
    }

    public Products(int productID, String title, Date date_create, double price, int quantity, String desc) {
        this.productID = productID;
        this.title = title;
        this.date_create = date_create;
        this.price = price;
        this.quantity = quantity;
        this.desc = desc;
    }

    public Products(int productID, String title, String desc, double price, double discount, Date date_create, Date date_updated, int categoryid, String thumbnail, int quantity) {
        this.productID = productID;
        this.title = title;
        this.desc = desc;
        this.price = price;
        this.discount = discount;
        this.date_create = date_create;
        this.date_updated = date_updated;
        this.categoryid = categoryid;
        this.thumbnail = thumbnail;
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
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

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", title=" + title + ", desc=" + desc + ", price=" + price + ", discount=" + discount + ", date_create=" + date_create + ", date_updated=" + date_updated + ", categoryid=" + categoryid + ", thumbnail=" + thumbnail + ", quantity=" + quantity + '}';
    }
}
