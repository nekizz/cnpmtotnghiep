/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.ComboDishesDAO;
import java.util.ArrayList;
import model.ComboDishes;
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
public class ComboDishesDAOTest {
    
    public ComboDishesDAOTest() {
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
     public void getAllComboDishes_testChuan() {
         System.out.println("kiem tra tim ban");
         ComboDishesDAO dao = new ComboDishesDAO();
         ArrayList<ComboDishes> listComboDishes = dao.getAllComboDishes();
         Assert.assertNotNull(listComboDishes);
         Assert.assertEquals(5, listComboDishes.size());
     }
     
    @Test
     public void searchComboDishesByID_testChuan() {
         System.out.println("kiem tra tim ban");
         ArrayList<ComboDishes> expRes = new ArrayList<>();
         String maMon = "COMBO1";
         ComboDishesDAO dao = new ComboDishesDAO();
         ArrayList<ComboDishes> listComboDishes = dao.searchComboDishes(maMon);
         Assert.assertNotNull(listComboDishes);
         Assert.assertEquals(1, listComboDishes.size());
         Assert.assertEquals(maMon, listComboDishes.get(0).getIdComboDishes());
     }
     
     @Test
     public void searchComboDishesByID_testNgoaiLe1() {
         System.out.println("kiem tra tim ban");
         String maMon = "ASD";
         ComboDishesDAO dao = new ComboDishesDAO();
         ArrayList<ComboDishes> listComboDishes = dao.searchComboDishes(maMon);
         Assert.assertEquals(0, listComboDishes.size());
     }
}
