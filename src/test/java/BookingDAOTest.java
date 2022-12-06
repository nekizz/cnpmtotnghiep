/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import dao.BookingDAO;
import java.util.ArrayList;
import java.util.Date;
import model.BookedTable;
import model.Booking;
import model.Client;
import model.ComboDishes;
import model.ComboOrdered;
import model.Dishes;
import model.DishesCombo;
import model.DishesOrdered;
import model.Table;
import model.User;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class BookingDAOTest {
    
    public BookingDAOTest() {
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
     public void addBooking_testChuan() {
        ArrayList<DishesOrdered> dod = new ArrayList<>();
        ArrayList<ComboOrdered> co = new ArrayList<>();
        ArrayList<BookedTable> listbt = new ArrayList<>();
        ArrayList<DishesCombo> listDishesCombo = new ArrayList<>();
 
        //add dishes
        Dishes cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        
        //add DishesCombo
        Dishes di = new Dishes("COCA1", "Nước uống coca", "Còn hàng", null, 10000, 0, "Đồ uống");
        listDishesCombo.add(new DishesCombo(1,di));
        
       //addCombo
        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "", 100000, 0, listDishesCombo, "Còn hàng");
        ComboOrdered da = new ComboOrdered(100000, 0, 300000, null, cdes, 3);
        co.add(da);
        
        
        //
        Table t = new Table("BC1", "Thường", "Còn bàn", null);
        BookedTable bt = new BookedTable("", t, co, dod, true);
        listbt.add(bt);
        Client c = new Client("U123", "Minh", "Hà Nội", "123", null, "minh123@gmail.com");
        User u = new User(1, "long123@", "123456", "Long", "Waiter");
        Date date = new Date();
        Booking b = new Booking(date, "", c, u, listbt);
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
         assertEquals(ok, true);
     }
     
     @Test
     public void addBooking_testNgoaiLe1() {
        Booking b = null;
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
        assertEquals(ok, false);
     }
     
     @Test
     public void addBooking_testNgoaiLe2() {
        ArrayList<DishesOrdered> dod = new ArrayList<>();
        ArrayList<ComboOrdered> co = new ArrayList<>();
        ArrayList<BookedTable> listbt = new ArrayList<>();
        ArrayList<DishesCombo> listDishesCombo = new ArrayList<>();
 
        //add dishes
        Dishes cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        
        //add DishesCombo
        Dishes di = new Dishes("COCA1", "Nước uống coca", "Còn hàng", null, 10000, 0, "Đồ uống");
        listDishesCombo.add(new DishesCombo(1,di));
        
       //addCombo
        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "", 100000, 0, listDishesCombo, "Còn hàng");
        ComboOrdered da = new ComboOrdered(100000, 0, 300000, null, cdes, 3);
        co.add(da);
        
        
        //
        Table t = new Table("BC1", "Thường", "Còn bàn", null);
        BookedTable bt = new BookedTable("", t, co, dod, true);
        listbt.add(bt);
        Client c = new Client("ádnaksjdnas", "Minh", "Hà Nội", "123", null, "minh123@gmail.com");
        User u = new User(1, "long123@", "123456", "Long", "Waiter");
        Date date = new Date();
        Booking b = new Booking(date, "", c, u, listbt);
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
         assertEquals(ok, false);
     }
     
     @Test
     public void addBooking_testNgoaiLe3() {
        ArrayList<DishesOrdered> dod = new ArrayList<>();
        ArrayList<ComboOrdered> co = new ArrayList<>();
        ArrayList<BookedTable> listbt = new ArrayList<>();
        ArrayList<DishesCombo> listDishesCombo = new ArrayList<>();
 
        //add dishes
        Dishes cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        
        //add DishesCombo
        Dishes di = new Dishes("COCA1", "Nước uống coca", "Còn hàng", null, 10000, 0, "Đồ uống");
        listDishesCombo.add(new DishesCombo(1,di));
        
       //addCombo
        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "", 100000, 0, listDishesCombo, "Còn hàng");
        ComboOrdered da = new ComboOrdered(100000, 0, 300000, null, cdes, 3);
        co.add(da);
        
        
        //
        Table t = new Table("BC1231", "Thường", "Còn bàn", null);
        BookedTable bt = new BookedTable("", t, co, dod, true);
        listbt.add(bt);
        Client c = new Client("U123", "Minh", "Hà Nội", "123", null, "minh123@gmail.com");
        User u = new User(1, "long123@", "123456", "Long", "Waiter");
        Date date = new Date();
        Booking b = new Booking(date, "", c, u, listbt);
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
         assertEquals(ok, false);
     }
     
     @Test
     public void addBooking_testNgoaiLe4() {
        ArrayList<DishesOrdered> dod = new ArrayList<>();
        ArrayList<ComboOrdered> co = new ArrayList<>();
        ArrayList<BookedTable> listbt = new ArrayList<>();
        ArrayList<DishesCombo> listDishesCombo = new ArrayList<>();
 
        //add dishes
        Dishes cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        
        //add DishesCombo
        Dishes di = new Dishes("COCA1", "Nước uống coca", "Còn hàng", null, 10000, 0, "Đồ uống");
        listDishesCombo.add(new DishesCombo(1,di));
        
       //addCombo
        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "", 100000, 0, listDishesCombo, "Còn hàng");
        ComboOrdered da = new ComboOrdered(100000, 0, 300000, null, cdes, 3);
        co.add(da);
        
        
        //
        Table t = new Table("BC1", "Thường", "Còn bàn", null);
        BookedTable bt = new BookedTable("", t, co, dod, true);
        listbt.add(bt);
        Client c = new Client("Uy123", "Minh", "Hà Nội", "123", null, "minh123@gmail.com");
        User u = new User(1, "long123@", "123456", "Long", "Waiter");
        Date date = new Date();
        Booking b = new Booking(date, "", c, u, listbt);
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
         assertEquals(ok, false);
     }
     
     @Test
     public void addBooking_testNgoaiLe5() {
        ArrayList<DishesOrdered> dod = new ArrayList<>();
        ArrayList<ComboOrdered> co = new ArrayList<>();
        ArrayList<BookedTable> listbt = new ArrayList<>();
        ArrayList<DishesCombo> listDishesCombo = new ArrayList<>();
 
        //add dishes
        Dishes cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
        
        //add DishesCombo
        Dishes di = new Dishes("COCA1", "Nước uống coca", "Còn hàng", null, 10000, 0, "Đồ uống");
        listDishesCombo.add(new DishesCombo(1,di));
        
       //addCombo
        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "", 100000, 0, listDishesCombo, "Còn hàng");
        ComboOrdered da = new ComboOrdered(100000, 0, 300000, null, cdes, 3);
        co.add(da);
        
        
        //
        Table t = new Table("BC1", "Thường", "Còn bàn", null);
        BookedTable bt = new BookedTable("", t, co, dod, true);
        listbt.add(bt);
        Client c = new Client("U123", "Minh", "Hà Nội", "123", null, "minh123@gmail.com");
        User u = new User(100, "long123@", "123456", "Long", "Waiter");
        Date date = new Date();
        Booking b = new Booking(date, "", c, u, listbt);
        BookingDAO dao = new BookingDAO();
        boolean ok = dao.addBooking(b);
         assertEquals(ok, false);
     }
}
