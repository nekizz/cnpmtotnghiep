<%-- 
    Document   : doChonban
    Created on : Dec 2, 2022, 10:06:31 PM
    Author     : ADMIN
--%>

<%@page import="model.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTable = request.getParameter("idTable");
    if (idTable == null) {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }
    ArrayList<Table> listTable = (ArrayList<Table>) session.getAttribute("listTable");
    for (Table t : listTable) {
        if(t.getIdTable().equals(idTable)){
            session.setAttribute("thisTable", t);
            break;
        }
    }
    response.sendRedirect("gdChonMon.jsp?idTable="+idTable);
%>
