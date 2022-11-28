/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

public class Restaurant {
    private int id, starlevel;
    private String address, description;
    private ArrayList<Table> table;

    public Restaurant(int id, int starlevel, String address, String description, ArrayList<Table> table) {
        this.id = id;
        this.starlevel = starlevel;
        this.address = address;
        this.description = description;
        this.table = table;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStarlevel() {
        return starlevel;
    }

    public void setStarlevel(int starlevel) {
        this.starlevel = starlevel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<Table> getTable() {
        return table;
    }

    public void setTable(ArrayList<Table> table) {
        this.table = table;
    }

}
