<%-- 
    Document   : doThemBooking
    Created on : Dec 1, 2022, 10:46:12 PM
    Author     : ADMIN
--%>

<%@page import="model.User"%>
<%@page import="model.Client"%>
<%@page import="model.Table"%>
<%@page import="model.BookedTable"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.DishesOrdered"%>
<%@page import="model.ComboOrdered"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookingDAO"%>
<%@page import="model.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String maBan = (String) session.getAttribute("idTable");
    if (maBan == "") {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }

    String url = "gdChonMon.jsp?idTable=" + maBan;
    ArrayList<ComboOrdered> listComboOrdered = (ArrayList<ComboOrdered>) session.getAttribute("listComboOrdered");
    ArrayList<DishesOrdered> listDishesOrdered = (ArrayList<DishesOrdered>) session.getAttribute("listDishesOrdered");
    if (listComboOrdered == null && listDishesOrdered == null) {
        response.sendRedirect(url);
        return;
    }
    BookingDAO dao = new BookingDAO();
    Date dateBooking = new Date(System.currentTimeMillis());
    Table t = (Table) session.getAttribute("thisTable");
    if (t == null) {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }
    Client c = (Client) session.getAttribute("client");
    User u = (User) session.getAttribute("user");
    ArrayList<BookedTable> listBookedTable = (ArrayList<BookedTable>) session.getAttribute("listBookedTable");
    listBookedTable.add(new BookedTable("", t, listComboOrdered, listDishesOrdered, true));
    Booking b = new Booking(dateBooking, "", c, u, listBookedTable);
    dao.addBooking(b);
    response.sendRedirect("gdChinhNV.jsp");
    return;
%>