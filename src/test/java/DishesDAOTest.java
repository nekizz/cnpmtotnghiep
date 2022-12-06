/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.DishesDAO;
import dao.TableDAO;
import java.util.ArrayList;
import model.Dishes;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
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
    
    @Test
     public void getAllDishes_testChuan() {
         System.out.println("kiem tra tim ban");
         DishesDAO dao = new DishesDAO();
         ArrayList<Dishes> listDishes = dao.getAllDishes();
         Assert.assertNotNull(listDishes);
         Assert.assertEquals(1, listDishes.size());
     }

    @Test
     public void searchDishesByID_testChuan() {
         System.out.println("kiem tra tim ban");
         ArrayList<Dishes> expRes = new ArrayList<>();
         String maMon = "KHOAITC";
         DishesDAO dao = new DishesDAO();
         ArrayList<Dishes> listDishes = dao.searchDishes(maMon);
         Assert.assertNotNull(listDishes);
         Assert.assertEquals(1, listDishes.size());
         Assert.assertEquals(maMon, listDishes.get(0).getIdDishes());
     }
     
     @Test
     public void searchDishesByID_testNgoaiLe1() {
         System.out.println("kiem tra tim ban");
         String tenMon = "ASD";
         DishesDAO dao = new DishesDAO();
         ArrayList<Dishes> listTableDAO = dao.searchDishes(tenMon);
         Assert.assertNull(listTableDAO);
     }
}
