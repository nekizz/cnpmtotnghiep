<%-- 
    Document   : gdChinhNV
    Created on : Nov 21, 2022, 10:12:02 PM
    Author     : ADMIN
--%>

<%@page import="model.User"%>
<%@page import="model.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
    <head> 

        <%@include file ="header.jsp" %> 
        <title >Giao diện nhân viên</title> 
    </head> 
    <%
        Client c = new Client("U123", "Long", "long@123", "Hà Nội", "0123", "");
        session.setAttribute("client", c);
        User u = new User(1, "longlong", "123456", "Hoàng Long", "Waiter");
        session.setAttribute("user", u);
        String information = u.getName() + " - " + u.getPosition();
    %>
    <body> 
        <div class="container"> 
            <h2 class="text-primary" style="text-align: left; margin-top: 20px"> Trang chủ nhân viên </h2>. 
            <div class="text-center" style="margin-top: 50px"> 
                <h3><%=information%></h3>
                <div style="margin-top: 50px">
                    <button class="btn btn-primary" onclick="window.top.location.href = 'gdChonBan.jsp'"> Đặt món </button>
                    <button class="btn btn-primary" onclick="window.top.location.href = 'error.jsp'"> Thông tin cá nhân </button> 
                    <button class="btn btn-primary" onclick="window.top.location.href = 'error.jsp'"> Thống kê </button> 
                </div>
            </div> 
        </div> 
    </body> 
</html> 
