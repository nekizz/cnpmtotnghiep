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
    private ArrayList<DishesCombo> dishesCombo;

    public ComboDishes() {
    }
    
    public ComboDishes(String idComboDishes, String name, String note, float price, float discount, ArrayList<DishesCombo> dishesCombo, String status) {
        this.idComboDishes = idComboDishes;
        this.name = name;
        this.note = note;
        this.price = price;
        this.discount = discount;
        this.dishesCombo = dishesCombo;
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

    public ArrayList<DishesCombo> getDishesCombo() {
        return dishesCombo;
    }

    public void setDishesCombo(ArrayList<DishesCombo> dishesCombo) {
        this.dishesCombo = dishesCombo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
