<%-- 
    Document   : GDConfirm
    Created on : Nov 21, 2022, 10:14:18 PM
    Author     : ADMIN
--%>

<%@page import="java.util.function.Consumer"%>
<%@page import="model.DishesOrdered"%>
<%@page import="model.ComboOrdered"%>
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

    <%  int count = 0;
        String maBan = request.getParameter("idTable");
        if (maBan == "") {
            response.sendRedirect("gdChinhNV.jsp");
            return;
        }
        float tongTien = 0;
        float tong1 = 0;
        float tong2 = 0;
        String url = "gdChonMon.jsp?idTable=" + maBan;
        ArrayList<ComboOrdered> listComboOrdered = (ArrayList<ComboOrdered>) session.getAttribute("listComboOrdered");
        ArrayList<DishesOrdered> listDishesOrdered = (ArrayList<DishesOrdered>) session.getAttribute("listDishesOrdered");
        if (listComboOrdered == null && listDishesOrdered == null) {
            response.sendRedirect(url);
            return;
        }
        if (listDishesOrdered != null) {
            for (DishesOrdered d : listDishesOrdered) {
                tong1 += d.getTotalAmount();
            }
        }
        if (listComboOrdered != null) {
            for (DishesOrdered d : listDishesOrdered) {
                tong2 += d.getTotalAmount();
            }
        }
        tongTien = tong1 + tong2;
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
                            <th scope="col">Tổng tiền</th>
                        </tr> 
                    </thead> 
                    <tbody>          
                        <%  if (listDishesOrdered != null)
                                for (int i = 0; i < listDishesOrdered.size(); i++) {
                        %> 
                        <tr> 
                            <th scope="row"><%=(count + 1)%></th> 
                            <td><%=listDishesOrdered.get(i).getDishes().getName()%></td> 
                            <td><%=listDishesOrdered.get(i).getPrice()%></td> 
                            <td><%=listDishesOrdered.get(i).getQuantity()%></td> 
                            <td><%=listDishesOrdered.get(i).getTotalAmount()%></td>
                        </tr> 
                        <%
                                count++;
                            }%>

                        <%  if (listComboOrdered != null)
                                for (int i = 0; i < listComboOrdered.size(); i++) {
                        %> 
                        <tr> 
                            <th scope="row"><%=(count + 1)%></th> 
                            <td><%=listComboOrdered.get(i).getComboDishes().getName()%></td> 
                            <td><%=listComboOrdered.get(i).getPrice()%></td> 
                            <td><%=listComboOrdered.get(i).getQuantity()%></td> 
                            <td><%=listComboOrdered.get(i).getTotalAmount()%></td>
                        </tr> 
                        <%
                                count++;
                            }%>

                    </tbody> 
                </table>
                <h4>Tổng tiền: <%=tongTien%></h4>

                <div class="text-center" style="margin-top: 10px;margin-left: 60%"> 
                    <button class="btn btn-primary" onclick="window.top.location.href = 'doThemBooking.jsp'"> Xác nhận </button>
                    <button class="btn btn-primary" onclick="window.top.location.href = 'doDatTiep.jsp'"> Đặt tiếp </button>
                </div> 

            </div>
        </div> 
    </body> 
</html>
