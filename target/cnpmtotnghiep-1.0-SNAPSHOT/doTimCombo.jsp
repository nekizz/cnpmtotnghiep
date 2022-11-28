<%-- 
    Document   : doTimCombo
    Created on : Nov 26, 2022, 10:27:27 PM
    Author     : ADMIN
--%>

<%@page import="model.ComboDishes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ComboDishesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 ComboDishesDAO dao = new ComboDishesDAO();
 ArrayList<ComboDishes> listComboDishes = dao.getAllComboDishes();
 session.setAttribute("isCombo", String.valueOf(true));
 session.setAttribute("listComboDishes", listComboDishes);
 response.sendRedirect("gdChonMon.jsp");
%>
