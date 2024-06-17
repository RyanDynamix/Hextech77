/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hotaru
 */
public class Feedback {
    private int id;
    private int productID;
    private int userID;
    private String note;

    public Feedback() {
    }

    public Feedback(int id, int productID, int userID, String note) {
        this.id = id;
        this.productID = productID;
        this.userID = userID;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", productID=" + productID + ", userID=" + userID + ", note=" + note + '}';
    }
    
}
