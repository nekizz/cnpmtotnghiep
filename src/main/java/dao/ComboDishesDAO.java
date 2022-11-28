/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.ComboDishes;

/**
 *
 * @author ADMIN
 */
public class ComboDishesDAO extends DAO{
    public ComboDishesDAO() {
        super();
    }

    public ArrayList<ComboDishes> getAllComboDishes(){
        ArrayList<ComboDishes> kq = null;
        String sql = "select * from tblcombodishes"; 
        try{
            CallableStatement cs = con.prepareCall(sql);
            ResultSet rs = cs.executeQuery();
             
            while(rs.next()){
                if(kq == null) kq = new ArrayList<ComboDishes>();
                ComboDishes cb = new ComboDishes();
                
                cb.setIdComboDishes(rs.getString("IdComboDishes"));
                cb.setName(rs.getString("Name"));
                cb.setStatus(rs.getString("Status"));
                cb.setPrice(rs.getFloat("Price"));
                cb.setDiscount(rs.getFloat("Discount"));
                cb.setNote(rs.getString("Description"));
                //nam hoc
                kq.add(cb);
            }
        }catch(Exception e){
            e.printStackTrace();
            kq = null;
        }   
        return kq;
    }
    
    public static void main(String[] args) {
        ComboDishesDAO dao = new ComboDishesDAO();
        ArrayList<ComboDishes> l= null;
        l = dao.getAllComboDishes();
        System.out.println(l.size());
    }

}

