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
import model.BookedTable;
import model.Booking;
import model.ComboOrdered;
import model.DishesOrdered;

/**
 *
 * @author ADMIN
 */
public class BookingDAO extends DAO {

    public BookingDAO() {
        super();
    }

    public boolean addBooking(Booking b) {
        String sqlAddBooking = "INSERT INTO tblbooking(ID, BookDay, Note, ClientIDCard, UserID) VALUES(?,?,?,?,?)";
        String sqlAddBookedTable = "INSERT INTO tblbookedtable(ID, IsCheckin, Note, TableIDTable, BookingID)  VALUES(?,?,?,?,?)";
        String sqlAddComboOrdered = "INSERT INTO tblcomboordered(ID, Price, Discount, Quantity, TotalAmount, Description, BookedTableID, ComboDishesID)  VALUES(?,?,?,?,?,?,?,?)";
        String sqlAddDishesOrdered = "INSERT INTO tbldishesordered(ID, Price, Discount, Quantity, TotalAmount, Description, BookedTableID, DishesID)  VALUES(?,?,?,?,?,?,?,?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        boolean result = true;
        try {
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sqlAddBooking, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, b.getId());
            ps.setString(2, sdf.format(b.getBookDay()));
            ps.setString(3, b.getNote());
            ps.setString(4, b.getClient().getIdCard());
            ps.setInt(5, b.getUser().getId());

            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                b.setId(generatedKeys.getInt(1));

                for (BookedTable bt : b.getBookedTable()) {
                    ps = con.prepareStatement(sqlAddBookedTable, Statement.RETURN_GENERATED_KEYS);
                    ps.setInt(1, bt.getId());
                    ps.setBoolean(2, bt.getIsCheckIn());
                    ps.setString(3, bt.getNote());
                    ps.setString(4, bt.getTable().getIdTable());
                    ps.setInt(5, b.getId());

                    ps.executeUpdate();
                    //get id of the new inserted booking
                    generatedKeys = ps.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        bt.setId(generatedKeys.getInt(1));
                    }

                    ArrayList<DishesOrdered> listDishesOrdered = new ArrayList<>();
                    listDishesOrdered = bt.getDishesOrdered();
                    ArrayList<ComboOrdered> listComboOrdered = new ArrayList<>();
                    listComboOrdered = bt.getComboOrdered();
                    if (listComboOrdered.size() < 1 && listDishesOrdered.size() < 1) {
                        //insert ComboOrdered
                        if (listComboOrdered.size() > 0) {
                            for (ComboOrdered co : listComboOrdered) {
                                ps = con.prepareStatement(sqlAddComboOrdered, Statement.RETURN_GENERATED_KEYS);
                                ps.setInt(1, co.getId());
                                ps.setFloat(2, co.getPrice());
                                ps.setFloat(3, co.getDiscount());
                                ps.setInt(4, co.getQuantity());
                                ps.setFloat(5, co.getTotalAmount());
                                ps.setString(6, co.getDescription());
                                ps.setInt(7, bt.getId());
                                ps.setString(8, co.getComboDishes().getIdComboDishes());

                                ps.executeUpdate();
                                //get id of the new inserted booking
                                generatedKeys = ps.getGeneratedKeys();
                                if (generatedKeys.next()) {
                                    co.setId(generatedKeys.getInt(1));
                                }
                            }
                        }

                        //insert DishesOrdered
                        if (listDishesOrdered.size() > 0) {
                            for (DishesOrdered dod : listDishesOrdered) {
                                ps = con.prepareStatement(sqlAddDishesOrdered, Statement.RETURN_GENERATED_KEYS);
                                ps.setInt(1, dod.getId());
                                ps.setFloat(2, dod.getPrice());
                                ps.setFloat(3, dod.getDiscount());
                                ps.setInt(4, dod.getQuantity());
                                ps.setFloat(5, dod.getTotalAmount());
                                ps.setString(6, dod.getDescription());
                                ps.setInt(7, dod.getId());
                                ps.setString(8, dod.getDishes().getIdDishes());

                                ps.executeUpdate();
                                //get id of the new inserted booking
                                generatedKeys = ps.getGeneratedKeys();
                                if (generatedKeys.next()) {
                                    dod.setId(generatedKeys.getInt(1));
                                }
                            }
                        }

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
            } catch (Exception ex) {
                result = false;
                ex.printStackTrace();
            }
        }
        return result;
    }

}
