/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Dishes;
import model.DishesOrdered;

/**
 *
 * @author Admin
 */
public class DishesOrderedDAO extends DAO{

    public DishesOrderedDAO() {
        super();
    }
    
    public DishesOrdered createDishesOrdered(Dishes d, int sl){
        DishesOrdered dishesOrdered = new DishesOrdered(sl, d.getPrice(), sl*d.getPrice()-d.getDiscount(), d.getDiscount(), "", d);
        return dishesOrdered;
    }
    
}
