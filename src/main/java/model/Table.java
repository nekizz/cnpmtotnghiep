/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
 
public class Table {
    private String idTable;
    private String type;
    private String status, description;

    public Table() {
    }

    public Table(String idTable, String type, String status, String description) {
        this.idTable = idTable;
        this.type = type;
        this.status = status;
        this.description = description;
    }

    public String getIdTable() {
        return idTable;
    }

    public void setIdTable(String idTable) {
        this.idTable = idTable;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    
    
}
