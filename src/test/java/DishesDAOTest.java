/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.DishesDAO;
import java.util.ArrayList;
import model.Dishes;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ADMIN
 */
public class DishesDAOTest {
    
    public DishesDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void testsearchDishes_Chuan() {
        System.out.println("getDishes");
        String ten = "KHOAILC";
        DishesDAO instance = new DishesDAO();
        ArrayList<Dishes> expResult = new ArrayList<>();
        Dishes d = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", null, 70000, 0, "Ăn nhẹ");
        d.setIdDishes("KHOAILC");
        d.setName("Khoai lang chiên");
        d.setStatus("Còn hàng");
        d.setDescription("");
        d.setPrice((float) 70000.0);
        d.setDiscount((float)0.0);
        d.setType("Ăn nhẹ");
        expResult.add(d);
        ArrayList<Dishes> result = instance.searchDishes(ten);

        assertEquals(expResult, result);
    }
}
