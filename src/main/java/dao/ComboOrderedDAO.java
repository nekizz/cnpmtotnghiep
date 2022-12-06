/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.ComboDishes;
import model.ComboOrdered;

/**
 *
 * @author Admin
 */
public class ComboOrderedDAO {

    public ComboOrderedDAO() {
        super();
    }
    
    public ComboOrdered createComboOrdered(ComboDishes cb, int sl){
        ComboOrdered comboDishes = new ComboOrdered(cb.getPrice(), cb.getDiscount(), cb.getPrice()*sl-cb.getDiscount(), "", cb, sl);
        
        return comboDishes;
    }
    
}
