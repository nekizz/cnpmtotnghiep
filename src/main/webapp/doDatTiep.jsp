<%-- 
    Document   : doDatTiep
    Created on : Dec 4, 2022, 12:25:01 AM
    Author     : ADMIN
--%>

<%@page import="model.DishesOrdered"%>
<%@page import="model.ComboOrdered"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BookedTable"%>
<%@page import="model.Table"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String maBan = (String) session.getAttribute("idTable");
    if (maBan == "") {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }
    Table t = (Table) session.getAttribute("thisTable");
    if (t == null) {
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
    
    ArrayList<String> listIDBookedTableDisplay = (ArrayList<String>) session.getAttribute("listIDBookedTableDisplay");
    if(listIDBookedTableDisplay == null){
        listIDBookedTableDisplay = new ArrayList<>();
    }
    
    listIDBookedTableDisplay.add(maBan);
    session.setAttribute("listIDBookedTableDisplay", listIDBookedTableDisplay);
    
    
    session.removeAttribute("listComboOrdered");
    session.removeAttribute("listDishesOrdered");
    session.removeAttribute("thisTable");
    session.removeAttribute("isCombo");
    
    response.sendRedirect("gdChonBan.jsp");
%>
