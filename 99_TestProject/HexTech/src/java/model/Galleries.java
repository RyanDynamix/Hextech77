/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hotaru
 */
public class Galleries {
    private int qalleryID;
    private int productID;
    private String thumbnail;

    public Galleries() {
    }

    public Galleries(int qalleryID, int productID, String thumbnail) {
        this.qalleryID = qalleryID;
        this.productID = productID;
        this.thumbnail = thumbnail;
    }

    public int getQalleryID() {
        return qalleryID;
    }

    public void setQalleryID(int qalleryID) {
        this.qalleryID = qalleryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Override
    public String toString() {
        return "Galleries{" + "qalleryID=" + qalleryID + ", productID=" + productID + ", thumbnail=" + thumbnail + '}';
    }
    
}
