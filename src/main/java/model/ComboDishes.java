/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

public class ComboDishes {
    private String idComboDishes;
    private String name, note, status;
    private float price, discount;
    private ArrayList<Dishes> dishes;

    public ComboDishes() {
    }
    
    public ComboDishes(String idComboDishes, String name, String note, float price, float discount, ArrayList<Dishes> dishes, String status) {
        this.idComboDishes = idComboDishes;
        this.name = name;
        this.note = note;
        this.price = price;
        this.discount = discount;
        this.dishes = dishes;
        this.status = status;
    }

    public String getIdComboDishes() {
        return idComboDishes;
    }

    public void setIdComboDishes(String idComboDishes) {
        this.idComboDishes = idComboDishes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public ArrayList<Dishes> getDishes() {
        return dishes;
    }

    public void setDishes(ArrayList<Dishes> dishes) {
        this.dishes = dishes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
