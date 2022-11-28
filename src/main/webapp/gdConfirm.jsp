<%-- 
    Document   : GDConfirm
    Created on : Nov 21, 2022, 10:14:18 PM
    Author     : ADMIN
--%>

<%@page import="dao.DishesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dishes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%@include file ="header.jsp" %> 
        <title>Giao diện xác nhận</title> 
    </head>

    <%
        DishesDAO dao = new DishesDAO();
        ArrayList<Dishes> listDishes = dao.getAllDishes();
    %> 

    <body> 
        <div class="container"> 
            <h2 class="text-primary text-primary" style="text-align: left; margin-top: 20px " > Xác nhận </h2>            
            <div style="margin-top: 50px">
                <table class="table" > 
                <thead> 
                    <tr> 
                        <th scope="col">STT</th> 
                        <th scope="col">Tên món</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Số lượng</th>
                    </tr> 
                </thead> 
                <tbody>                     
                    <%
                    if (listDishes != null)
                        for (int i = 0; i < listDishes.size(); i++) {
                    %> 
                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listDishes.get(i).getName()%></td> 
                        <td><%=listDishes.get(i).getPrice()%></td> 
                        <td><%=listDishes.get(i).getStatus()%></td> 
                    </tr> 
                    <%}%> 
                </tbody> 
            </table>
            <button class="btn btn-primary" style="margin-top: 10px;margin-left: 60%" onclick="window.top.location.href = 'error.jsp'"> Tiếp tục </button> 
            </div>
        </div> 
    </body> 
</html>
