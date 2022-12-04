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
    String maBan = (String) session.getAttribute("idTable");
    if (maBan == null) {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }
    String url = "gdChonMon.jsp?idTable="+ maBan;
    ComboDishesDAO dao = new ComboDishesDAO();
    ArrayList<ComboDishes> listComboDishes = dao.getAllComboDishes();
    session.setAttribute("isCombo", String.valueOf(true));
    session.setAttribute("listComboDishes", listComboDishes);
    response.sendRedirect(url);
%>
