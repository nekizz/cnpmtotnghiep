/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Date;

public class Booking {
    private int id;
    private Date bookDay;
    private String note;
    private Client client;
    private User user;
    ArrayList<BookedTable> bookedTable;

    public Booking(int id, Date bookDay, String note, Client client, User user, ArrayList<BookedTable> bookedTable) {
        this.id = id;
        this.bookDay = bookDay;
        this.note = note;
        this.client = client;
        this.user = user;
        this.bookedTable = bookedTable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getBookDay() {
        return bookDay;
    }

    public void setBookDay(Date bookDay) {
        this.bookDay = bookDay;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ArrayList<BookedTable> getBookedTable() {
        return bookedTable;
    }

    public void setBookedTable(ArrayList<BookedTable> bookedTable) {
        this.bookedTable = bookedTable;
    }
    
}
