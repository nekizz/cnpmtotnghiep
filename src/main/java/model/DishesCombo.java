/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class DishesCombo {
    private int id;
    private String idDishes, idComboDishes;
    private Dishes dishes;

    public DishesCombo(int id, String idDishes, String idComboDishes, Dishes dishes) {
        this.id = id;
        this.idDishes = idDishes;
        this.idComboDishes = idComboDishes;
        this.dishes = dishes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdDishes() {
        return idDishes;
    }

    public void setIdDishes(String idDishes) {
        this.idDishes = idDishes;
    }

    public String getIdComboDishes() {
        return idComboDishes;
    }

    public void setIdComboDishes(String idComboDishes) {
        this.idComboDishes = idComboDishes;
    }

    public Dishes getDishes() {
        return dishes;
    }

    public void setDishes(Dishes dishes) {
        this.dishes = dishes;
    }
}
