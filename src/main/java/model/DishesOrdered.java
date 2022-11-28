/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class DishesOrdered {
    private int id, quantity;
    private float price, totalAmount, discount;
    private String description;
    private Dishes dishes;

    public DishesOrdered(int id, int quantity, float price, float totalAmount, float discount, String description, Dishes dishes) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.totalAmount = totalAmount;
        this.discount = discount;
        this.description = description;
        this.dishes = dishes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Dishes getDishes() {
        return dishes;
    }

    public void setDishes(Dishes dishes) {
        this.dishes = dishes;
    }

  
}
