/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class ComboOrdered {
   private int id;
   private int quantity;
   private float price, discount, totalAmount;
   private String description;
   private ComboDishes comboDishes;

    public ComboOrdered(float price, float discount, float totalAmount, String description, ComboDishes comboDishes, int quantity) {
        this.price = price;
        this.discount = discount;
        this.totalAmount = totalAmount;
        this.description = description;
        this.comboDishes = comboDishes;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ComboDishes getComboDishes() {
        return comboDishes;
    }

    public void setComboDishes(ComboDishes comboDishes) {
        this.comboDishes = comboDishes;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
   
}
