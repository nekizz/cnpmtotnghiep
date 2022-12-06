/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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

/**
 *
 * @author ADMIN
 */
public class BookingDAO extends DAO {

    public BookingDAO() {
        super();
    }

    public boolean addBooking(Booking b) {
        String sqlAddBooking = "INSERT INTO tblbooking(BookDay, Note, ClientIDCard, UserID) VALUES(?,?,?,?)";
        String sqlAddBookedTable = "INSERT INTO tblbookedtable(IsCheckin, Note, TableIDTable, BookingID)  VALUES(?,?,?,?)";
        String sqlAddComboOrdered = "INSERT INTO tblcomboordered(Price, Discount, Quantity, TotalAmount, Description, BookedTableID, ComboDishesID)  VALUES(?,?,?,?,?,?,?)";
        String sqlAddDishesOrdered = "INSERT INTO tbldishesordered(Price, Discount, Quantity, TotalAmount, Description, BookedTableID, DishesID)  VALUES(?,?,?,?,?,?,?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(1);
        boolean result = true;
        try {
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sqlAddBooking, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, sdf.format(b.getBookDay()));
            ps.setString(2, b.getNote());
            ps.setString(3, b.getClient().getIdCard());
            ps.setInt(4, b.getUser().getId());
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                b.setId(generatedKeys.getInt(1));
            }
            System.out.println(2);
            
            for (BookedTable bt : b.getBookedTable()) {
                ps = con.prepareStatement(sqlAddBookedTable, Statement.RETURN_GENERATED_KEYS);
                ps.setBoolean(1, bt.getIsCheckIn());
                ps.setString(2, bt.getNote());
                ps.setString(3, bt.getTable().getIdTable());
                ps.setInt(4, b.getId());
                ps.executeUpdate();
                generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    bt.setId(generatedKeys.getInt(1));
                }
                System.out.println(3);
                ArrayList<DishesOrdered> listDishesOrdered = new ArrayList<>();
                listDishesOrdered = bt.getDishesOrdered();
                ArrayList<ComboOrdered> listComboOrdered = new ArrayList<>();
                listComboOrdered = bt.getComboOrdered();
                
                if (listComboOrdered != null || listDishesOrdered != null) {
                    //insert ComboOrdered
                    if (listComboOrdered != null) {
                        for (ComboOrdered co : listComboOrdered) {
                            ps = con.prepareStatement(sqlAddComboOrdered, Statement.RETURN_GENERATED_KEYS);
                            ps.setFloat(1, co.getPrice());
                            ps.setFloat(2, co.getDiscount());
                            ps.setInt(3, co.getQuantity());
                            ps.setFloat(4, co.getTotalAmount());
                            ps.setString(5, co.getDescription());
                            ps.setInt(6, bt.getId());
                            ps.setString(7, co.getComboDishes().getIdComboDishes());

                            ps.executeUpdate();
                            generatedKeys = ps.getGeneratedKeys();
                            if (generatedKeys.next()) {
                                co.setId(generatedKeys.getInt(1));
                            }
                            System.out.println(4);
                        }
                    }

                    //insert DishesOrdered
                    if (listDishesOrdered!= null) {
                        for (DishesOrdered dod : listDishesOrdered) {
                            ps = con.prepareStatement(sqlAddDishesOrdered, Statement.RETURN_GENERATED_KEYS);
                            ps.setFloat(1, dod.getPrice());
                            ps.setFloat(2, dod.getDiscount());
                            ps.setInt(3, dod.getQuantity());
                            ps.setFloat(4, dod.getTotalAmount());
                            ps.setString(5, dod.getDescription());
                            ps.setInt(6, bt.getId());
                            ps.setString(7, dod.getDishes().getIdDishes());

                            ps.executeUpdate();
                            //get id of the new inserted booking
                            generatedKeys = ps.getGeneratedKeys();
                            if (generatedKeys.next()) {
                                dod.setId(generatedKeys.getInt(1));
                            }
                            System.out.println(5);
                        }
                    }
                        
                    con.commit();
                } else {
                    result = false;
                    try {
                        con.rollback();
                        con.setAutoCommit(true);
                    } catch (Exception ex) {
                        result = false;
                        ex.printStackTrace();
                    }
                    return false;
                }
            }

        } catch (Exception e) {
            result = false;
            try {
                con.rollback();
            } catch (Exception ex) {
                result = false;
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (Exception ex) {
                result = false;
                ex.printStackTrace();
            }
        }
        return result;
    }

//    public static void main(String[] args) {
//        ArrayList<DishesOrdered> dod = new ArrayList<>();
//        ArrayList<ComboOrdered> co = new ArrayList<>();
//        ArrayList<BookedTable> listbt = new ArrayList<>();
//        ArrayList<Dishes> lisDishes = new ArrayList<>();
//        DishesCombo cd = new Dishes("KHOAILC", "Khoai lang chiên", "Còn hàng", "rrr", 70000, 0, "Ăn nhẹ");
//        lisDishes.add(cd);
//        ComboDishes cdes = new ComboDishes("COMBO1", "Combo tình yêu", "rr", 550000, 0, lisDishes, "Còn hàng");
//        ComboOrdered da = new ComboOrdered(123456, 0, 123, "rr", cdes, 3);
//        co.add(da);
//        dod.add(new DishesOrdered(3, 70000, 210000, 0, "ád", cd));
//        Table t = new Table("BC1", "VIP", "Còn bàn", "fff");
//        BookedTable bt = new BookedTable("", t, co, dod, true);
//        listbt.add(bt);
//        Client c = new Client("U123", "Minh", "Hà Nội", "01234", "hj", "long@gmail.com");
//        User u = new User(1, "longlong", "123456", "Hoàng Long", "Waiter");
//        Date date = new Date();
//        Booking b = new Booking(date, "", c, u, listbt);
//        BookingDAO dao = new BookingDAO();
//        boolean ok = dao.addBooking(b);
//        System.out.println(ok);
//    }
}
