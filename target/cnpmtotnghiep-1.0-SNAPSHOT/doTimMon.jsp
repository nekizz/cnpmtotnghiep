<%-- 
    Document   : doTimMon
    Created on : Nov 26, 2022, 5:13:41 PM
    Author     : ADMIN
--%>

<%@page import="model.Dishes"%>
<%@page import="dao.DishesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 DishesDAO dao = new DishesDAO();
 ArrayList<Dishes> listDishes = dao.getAllDishes();
 session.setAttribute("isCombo", String.valueOf(false));
 session.setAttribute("listDishes", listDishes);
 response.sendRedirect("gdChonMon.jsp");
%>

