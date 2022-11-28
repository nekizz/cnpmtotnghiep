<%-- 
    Document   : gdChonMon
    Created on : Nov 26, 2022, 10:30:00 PM
    Author     : ADMIN
--%>
<%@page import="dao.ComboDishesDAO"%>
<%@page import="model.ComboDishes"%>
<%@page import="dao.DishesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dishes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file ="header.jsp" %> 
        <title>Giao diện chọn món</title>
    </head>

    <%
        ArrayList<Dishes> listDishes = null;
        ArrayList<ComboDishes> listComboDishes = null;
        String isCombo = "false";
        String tenMon = request.getParameter("tenMon");
        DishesDAO dao = new DishesDAO();
        ComboDishesDAO dao1 = new ComboDishesDAO();
        isCombo = (String) session.getAttribute("isCombo");
        if (isCombo == "true") {
        if (tenMon == null) {
                tenMon = "";
                listComboDishes = dao1.getAllComboDishes();
            }
            else {
                listComboDishes = dao1.searchComboDishes(tenMon);
            }
        } else {
            if (tenMon == null) {
                tenMon = "";
                listDishes = dao.getAllDishes();
            } else {
                listDishes = dao.searchDishes(tenMon);
            }
        }
    %> 

    <body>
        <div class="container"> 
            <h2 class="text-primary text-primary" style="text-align: left; margin-top: 20px " > Đặt món </h2>  

            <div style="margin-top: 60px">
                <button class="btn btn-primary" onclick="window.top.location.href = 'doTimMon.jsp'"> Món lẻ </button> 
                <button class="btn btn-primary" onclick="window.top.location.href = 'doTimCombo.jsp'"> Combo </button> 
            </div>

            <form name="timkhachhang" action="gdChonMon.jsp" method="post" style="margin-top: 10px"> 
                <div class="text-center row"> 
                    <div class="col-sm-6 col-md-2"> 
                    </div> 
                    <div class="col-sm-6 col-md-6" style="    display: flex;
                         justify-content: flex-end"> 
                        <input type="text" name="tenMon" value="<%=tenMon%>" class="form-control" id="tenMon" placeholder="Nhập tên..." style="width: 30%"></div> 
                    <div class="col-6 col-md-2"> 
                        <button class="btn btn-primary" type="submit">Tìm kiếm </button> 
                    </div>            
                </div> 
            </form> 

            <table class="table" style="margin-top: 100px"> 
                <thead> 
                    <tr> 
                        <th scope="col">STT</th> 
                        <th scope="col">Mã món</th> 
                        <th scope="col">Tên món</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Chọn</th> 
                    </tr> 
                </thead> 
                <tbody>                     
                    <%
                        if (listDishes != null)
                            for (int i = 0; i < listDishes.size(); i++) {
                    %> 
                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listDishes.get(i).getIdDishes()%></td> 
                        <td><%=listDishes.get(i).getName()%></td> 
                        <td><%=listDishes.get(i).getPrice()%></td> 
                        <td><%=listDishes.get(i).getStatus()%></td> 
                        <td><input type="number" id="quantity" name="quantity" min="1" max="5"></td> 
                        <td><a class="btn btn-success btn-sm" 
                               href="gdConfirm.jsp?idkh=<%=listDishes.get(i).getIdDishes()%>">Chọn</a></td> 
                    </tr> 
                    <%}%> 
                    <%
                        if (listComboDishes != null)
                            for (int i = 0; i < listComboDishes.size(); i++) {
                    %> 
                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listComboDishes.get(i).getIdComboDishes()%></td> 
                        <td><%=listComboDishes.get(i).getName()%></td> 
                        <td><%=listComboDishes.get(i).getPrice()%></td> 
                        <td><%=listComboDishes.get(i).getStatus()%></td> 
                        <td><input type="number" id="quantity" name="quantity" min="1" max="5"></td> 
                        <td><a class="btn btn-success btn-sm" 
                               href="gdConfirm.jsp?idkh=<%=listComboDishes.get(i).getIdComboDishes()%>">Chọn</a></td> 
                    </tr> 
                    <%}%> 
                </tbody> 
            </table> 


            <div style="margin-top: 150px">
                <h5>Món đã đặt:</h5>
                <table class="table" > 
                    <thead> 
                        <tr> 
                            <th scope="col">STT</th> 
                            <th scope="col">Tên món</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Hủy</th> 
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
                            <td><a class="btn btn-success btn-sm" href="error.jsp">Hủy</a></td> 
                        </tr> 
                        <%}%> 

                    </tbody> 
                </table>
                <button class="btn btn-primary" style="margin-top: 10px" onclick="window.top.location.href = 'gdConfirm.jsp'"> Tiếp tục </button> 
            </div>
        </div> 
    </body> 
</html>
