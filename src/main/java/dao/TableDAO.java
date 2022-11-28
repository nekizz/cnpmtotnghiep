/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Table;

/**
 *
 * @author ADMIN
 */
public class TableDAO extends DAO{

    public TableDAO() {
        super();
    }

    public ArrayList<Table> getAllTable() {
        ArrayList<Table> kq = new ArrayList<>();
        String sql = "select * from tbltable"; //su dung stored procedure
        try{
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                Table tb = new Table();
                tb.setIdTable(rs.getString("IdTable"));
                tb.setType(rs.getString("Type"));
                tb.setStatus(rs.getString("Status"));
                tb.setDescription(rs.getString("Description"));
                kq.add(tb);
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = null;
        }   
        return kq;
    }

    public ArrayList<Table> searchTable(String idTable) {
        ArrayList<Table> kq = new ArrayList<>();
        String sql = "select * from tbltable where IdTable like ?"; //su dung stored procedure
        try{
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, "%"+idTable+"%");
            ResultSet rs = cs.executeQuery();
             
            while(rs.next()){
                Table tb = new Table();
                tb.setIdTable(rs.getString("IdTable"));
                tb.setType(rs.getString("Type"));
                tb.setStatus(rs.getString("Status"));
                tb.setDescription(rs.getString("Description"));
                //nam hoc
                kq.add(tb);
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = null;
        }   
        return kq;
    }      
}
