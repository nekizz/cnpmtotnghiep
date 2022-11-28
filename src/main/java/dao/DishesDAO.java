/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Dishes;


public class DishesDAO extends DAO{

    public DishesDAO() {
        super();
    }
    
    public ArrayList<Dishes> getAllDishes(){
        ArrayList<Dishes> kq = new ArrayList<>();
        String sql = "select * from tbldishes"; 
        try{
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
             
            while(rs.next()){
                Dishes ds = new Dishes();
                ds.setIdDishes(rs.getString("IdDishes"));
                ds.setName(rs.getString("Name"));
                ds.setStatus(rs.getString("Status"));
                ds.setPrice(rs.getFloat("Price"));
                ds.setDiscount(rs.getFloat("Discount"));
                ds.setDescription(rs.getString("Description"));
                kq.add(ds);
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = null;
        }   
        return kq;
    }
    
    public ArrayList<Dishes> searchDishes(String tenMon){
        ArrayList<Dishes> kq = new ArrayList<>();
        String sql = "select * from tbldishes where IdDishes like ?"; 
        try{
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, "%"+tenMon+"%");
            ResultSet rs = cs.executeQuery();
             
            while(rs.next()){
                Dishes ds = new Dishes();
                ds.setIdDishes(rs.getString("IdDishes"));
                ds.setName(rs.getString("Name"));
                ds.setStatus(rs.getString("Status"));
                ds.setPrice(rs.getFloat("Price"));
                ds.setDiscount(rs.getFloat("Discount"));
                ds.setDescription(rs.getString("Description"));
                
                kq.add(ds);
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = null;
        }   
        return kq;
    }
//    
//    public static void main(String[] args) {
//        DishesDAO dao = new DishesDAO();
//        ArrayList<Dishes> l = new ArrayList<>();
//        l = dao.getAllDishes();
//        System.out.println(l.size());
//    }
    
}
