<%-- 
    Document   : gdChonMon
    Created on : Nov 26, 2022, 10:30:00 PM
    Author     : ADMIN
--%>
<%@page import="model.DishesOrdered"%>
<%@page import="model.ComboOrdered"%>
<%@page import="dao.ComboDishesDAO"%>
<%@page import="model.ComboDishes"%>
<%@page import="dao.DishesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dishes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        function themDV(idFood) {
            var soluong = 0;
            soLuong = document.getElementById("quantity" + idFood).value;
            window.location.replace("doChonMon.jsp?idMon=" + idFood + "&soLuong=" + soLuong);
        }


        function themDVCombo(idFood) {
            var soluong = 0;
            soLuong = document.getElementById("quantity" + idFood).value;
            window.location.replace("doChonCombo.jsp?idCombo=" + idFood + "&soLuong=" + soLuong);
        }
    </script>
    <head>
        <%@include file ="header.jsp" %> 
        <title>Giao diện chọn món</title>
    </head>

    <%  int count =0;
        String maBan = request.getParameter("idTable");
        if (maBan == "") {
            response.sendRedirect("gdChinhNV.jsp");
            return;
        }
        session.setAttribute("idTable", maBan);

        int soLuong = 0;
        String url = "gdChonMon.jsp?idTable=" + maBan;
        String isCombo = (String) session.getAttribute("isCombo");
        if (isCombo == null) {
            isCombo = "false";
        }

        DishesDAO dao = new DishesDAO();
        ComboDishesDAO dao1 = new ComboDishesDAO();

        ArrayList<Dishes> listDishes = null;
        ArrayList<ComboDishes> listComboDishes = null;

        String tenMon = request.getParameter("tenMon");
        ArrayList<DishesOrdered> listDishesOrdered = (ArrayList<DishesOrdered>) session.getAttribute("listDishesOrdered");
        ArrayList<ComboOrdered> listComboOrdered = (ArrayList<ComboOrdered>) session.getAttribute("listComboOrdered");

        if (isCombo == "true") {
            if (tenMon == null) {
                tenMon = "";
                listComboDishes = dao1.getAllComboDishes();
            } else {
                listComboDishes = dao1.searchComboDishes(tenMon);

            }
            session.setAttribute("listComboDishes", listComboDishes);
        } else {
            if (tenMon == null) {
                tenMon = "";
                listDishes = dao.getAllDishes();
            } else {
                listDishes = dao.searchDishes(tenMon);
            }
            session.setAttribute("listDishes", listDishes);
        }

        session.setAttribute("isCombo", isCombo);
    %>

    <body>
        <div class="container"> 
            <h2 class="text-primary text-primary" style="text-align: left; margin-top: 20px " > Đặt món </h2>  

            <div style="margin-top: 60px">
                <button class="btn btn-primary" onclick="window.top.location.href = 'doTimMon.jsp'"> Món lẻ </button> 
                <button class="btn btn-primary" onclick="window.top.location.href = 'doTimCombo.jsp'"> Combo </button> 
            </div>

            <form name="timkhachhang" action=<%=url%> method="post" style="margin-top: 10px"> 
                <div class="text-center row"> 
                    <div class="col-sm-6 col-md-2"> 
                    </div> 
                    <div class="col-sm-6 col-md-6" style="    display: flex;
                         justify-content: flex-end"> 
                        <input type="text" name="tenMon" value="<%=tenMon%>" class="form-control" id="tenMon" placeholder="Nhập tên..." style="width: 30%"></div> 
                    <div class="col-6 col-md-2"> 
                        <button class="btn btn-primary" type="submit"> Tìm kiếm </button> 
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
                                String funcThem = "\"themDV('" + listDishes.get(i).getIdDishes().toString() + "')\"";
                             
                    %> 

                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listDishes.get(i).getIdDishes()%></td> 
                        <td><%=listDishes.get(i).getName()%></td> 
                        <td><%=listDishes.get(i).getPrice()%></td> 
                        <td><%=listDishes.get(i).getStatus()%></td> 
                        <td><input type="number" id="<%="quantity" + listDishes.get(i).getIdDishes()%>" value="<%=soLuong%>" name="quantity" min="0" max="500"></td> 
                        <td>
                            <button class="btn btn-primary" style="margin-top: 10px; background-color: forestgreen" onclick=<%=funcThem%>> Chọn </button>
                        </td> 

                    </tr> 
                    <%}%> 

                    <%
                        if (listComboDishes != null)
                            for (int i = 0; i < listComboDishes.size(); i++) {
                                String funcThemCombo = "\"themDVCombo('" + listComboDishes.get(i).getIdComboDishes().toString() + "')\"";
                    %> 
                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listComboDishes.get(i).getIdComboDishes()%></td> 
                        <td><%=listComboDishes.get(i).getName()%></td> 
                        <td><%=listComboDishes.get(i).getPrice()%></td> 
                        <td><%=listComboDishes.get(i).getStatus()%></td> 
                        <td><input type="number" id="<%="quantity" + listComboDishes.get(i).getIdComboDishes()%>" value="<%=soLuong%>" name="quantity" min="0" max="500"></td> 
                        <td><button class="btn btn-primary" style="margin-top: 10px; background-color: forestgreen" onclick=<%=funcThemCombo%>> Chọn </button></td> 
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
                            if (listDishesOrdered != null)
                                for (int i = 0; i < listDishesOrdered.size(); i++) {
                        %>      
                        <tr> 
                            <th scope="row"><%=(count + 1)%></th> 
                            <td><%=listDishesOrdered.get(i).getDishes().getName()%></td> 
                            <td><%=listDishesOrdered.get(i).getTotalAmount()%></td> 
                            <td><%=listDishesOrdered.get(i).getQuantity()%></td> 
                            <td><a class="btn btn-success btn-sm" href="error.jsp">Hủy</a></td> 
                        </tr> 
                        <%
                            count++;
                        }%>
                            
                            
                        <%
                            if (listComboOrdered != null)
                                for (int i = 0; i < listComboOrdered.size(); i++) {
                        %> 
                        <tr> 
                            <th scope="row"><%=(count + 1)%></th> 
                            <td><%=listComboOrdered.get(i).getComboDishes().getName()%></td> 
                            <td><%=listComboOrdered.get(i).getTotalAmount()%></td> 
                            <td><%=listComboOrdered.get(i).getQuantity()%></td> 
                            <td><a class="btn btn-success btn-sm" href="error.jsp">Hủy</a></td> 
                        </tr> 
                        <%
                            count++;
                        }%>
                    </tbody> 
                </table>
                <button class="btn btn-primary" style="margin-top: 10px" onclick="window.top.location.href = 'gdConfirm.jsp'"> Tiếp tục </button> 
            </div>
        </div> 
    </body> 
</html>



