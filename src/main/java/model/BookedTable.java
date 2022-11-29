/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

public class BookedTable {
    private int id;
    private String note;
    private boolean isCheckIn;
    private Table table;
    private ArrayList<ComboOrdered> comboOrdered;
    private ArrayList<DishesOrdered> dishesOrdered;

    public BookedTable(int id, String note, Table table, ArrayList<ComboOrdered> comboOrdered, ArrayList<DishesOrdered> dishesOrdered, boolean isCheckIn) {
        this.id = id;
        this.note = note;
        this.table = table;
        this.comboOrdered = comboOrdered;
        this.dishesOrdered = dishesOrdered;
        this.isCheckIn = isCheckIn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    public ArrayList<ComboOrdered> getComboOrdered() {
        return comboOrdered;
    }

    public void setComboOrdered(ArrayList<ComboOrdered> comboOrdered) {
        this.comboOrdered = comboOrdered;
    }

    public ArrayList<DishesOrdered> getDishesOrdered() {
        return dishesOrdered;
    }

    public void setDishesOrdered(ArrayList<DishesOrdered> dishesOrdered) {
        this.dishesOrdered = dishesOrdered;
    }

    public boolean getIsCheckIn() {
        return isCheckIn;
    }

    public void setIsCheckIn(boolean isCheckIn) {
        this.isCheckIn = isCheckIn;
    }
    
    
     
}
