/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Dishes {
    private String idDishes, name, status, description;
    private float price, discount;

    public Dishes() {
    }
    

    public Dishes(String idDishes, String name, String status, String description, float price, float discount) {
        this.idDishes = idDishes;
        this.name = name;
        this.status = status;
        this.description = description;
        this.price = price;
        this.discount = discount;
    }

    public String getIdDishes() {
        return idDishes;
    }

    public void setIdDishes(String idDishes) {
        this.idDishes = idDishes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    
}
