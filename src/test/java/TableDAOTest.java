/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.TableDAO;
import java.util.ArrayList;
import model.Table;
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

//     @Test
//     public void searchTableByID_testChuan() {
//         System.out.println("kiem tra tim ban");
//         ArrayList<Table> expRes = new ArrayList<>();
//         String maBan = "BC1";
//         Table t = new Table("BC1", "VIP", "Còn bàn", null);
//         expRes.add(t);
//         TableDAO dao = new TableDAO();
//         ArrayList<Table> listTableDAO = dao.searchTable(maBan);
//         Assert.assertNotNull(listTableDAO);
//         Assert.assertEquals(1, listTableDAO.size());
//         Assert.assertEquals(maBan, listTableDAO.get(0).getIdTable());
//     }
//     
//     @Test
//     public void searchTableByID_testNgoaiLe1() {
//         System.out.println("kiem tra tim ban");
//         String maBan = "ASD";
//         TableDAO dao = new TableDAO();
//         ArrayList<Table> listTableDAO = dao.searchTable(maBan);
//         Assert.assertNull(listTableDAO);
//     }
}
