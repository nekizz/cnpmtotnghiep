<%-- 
    Document   : gdChinhNV
    Created on : Nov 21, 2022, 10:12:02 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head> 

        <%@include file ="header.jsp" %> 
        <title >Giao diện nhân viên</title> 
    </head> 
    <body> 
        <div class="container"> 
            <h2 class="text-primary" style="text-align: left; margin-top: 20px"> Trang chủ nhân viên </h2>. 
            <div class="text-center" style="margin-top: 50px"> 
                <button class="btn btn-primary" onclick="window.top.location.href = 'gdChonBan.jsp'"> Đặt món </button>
                <button class="btn btn-primary" onclick="window.top.location.href = 'error.jsp'"> Thông tin cá nhân </button> 
                <button class="btn btn-primary" onclick="window.top.location.href = 'error.jsp'"> Thống kê </button> 
            </div> 
        </div> 
    </body> 
</html> 
