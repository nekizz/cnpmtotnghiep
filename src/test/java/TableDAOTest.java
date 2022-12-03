/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.TableDAO;
import java.util.ArrayList;
import model.Table;
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
public class TableDAOTest {
    
    public TableDAOTest() {
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
        System.out.println("getTable");
        String ten = "TN1";
        TableDAO instance = new TableDAO();
        ArrayList<Table> expResult = new ArrayList<>();
        Table d = new Table("TN1", "Thường", "Còn bàn", null);
        expResult.add(d);
        ArrayList<Table> result = instance.searchTable(ten);
        
        assertEquals(expResult.get(0).getDescription(), result.get(0).getDescription());
        assertEquals(expResult.get(0).getIdTable(), result.get(0).getIdTable());
    }
}
