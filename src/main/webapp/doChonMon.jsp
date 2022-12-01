<%-- 
    Document   : chonMon.jsp
    Created on : Nov 29, 2022, 10:52:47 PM
    Author     : ADMIN
--%>


<%@page import="java.time.Instant"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.DishesOrdered"%>
<%@page import="model.Dishes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String idFood = request.getParameter("idMon");
    String soLuong = request.getParameter("soLuong");
    String maBan = (String) session.getAttribute("idTable");

    if (maBan == "") {
        response.sendRedirect("gdChinhNV.jsp");
        return;
    }
    String url = "gdChonMon.jsp?idTable=" + maBan;
    if (idFood == "" && soLuong == "") {
        response.sendRedirect("gdChonBan.jsp");
        return;
    }

    String isCombo = (String) session.getAttribute("isCombo");
    if (isCombo == null) {
        response.sendRedirect("error.jsp");
        return;
    }
    if (isCombo == "false") {
        ArrayList<Dishes> listDishes = (ArrayList<Dishes>) session.getAttribute("listDishes");
        if (listDishes == null) {
            response.sendRedirect("gdChonBan.jsp");
            return;
        }
        Map<Object, Long> mapping = new HashMap<>();
        long unixTime = Instant.now().getEpochSecond();
        for (Dishes co : listDishes) {
            if (co.getIdDishes().contains(idFood)) {
                ArrayList<DishesOrdered> listDishesOrdered = null;
                listDishesOrdered = (ArrayList<DishesOrdered>) session.getAttribute("listDishesOrdered");
                if (listDishesOrdered == null) {
                    listDishesOrdered = new ArrayList<>();
                    float totalAmount = co.getPrice() - co.getDiscount();
                    int soLuongInt = Integer.parseInt(soLuong);
                    listDishesOrdered.add(new DishesOrdered(soLuongInt, co.getPrice(), totalAmount, co.getDiscount(), co.getDescription(), co));
                    session.setAttribute("listDishesOrdered", listDishesOrdered);
                    response.sendRedirect(url);
                    return;
                } else {
                    int soLuongInt = Integer.parseInt(soLuong);
                    for (DishesOrdered d : listDishesOrdered) {
                        if (d.getDishes().getIdDishes().equals(co.getIdDishes())) {
                            int oldQuantity = d.getQuantity();
                            d.setQuantity(oldQuantity + soLuongInt);
                            //set total mount nua
                            session.setAttribute("listDishesOrdered", listDishesOrdered);
                            response.sendRedirect(url);
                            return;
                        }
                    }
                    float totalAmount = co.getPrice() - co.getDiscount();
                    listDishesOrdered.add(new DishesOrdered(soLuongInt, co.getPrice(), totalAmount, co.getDiscount(), co.getDescription(), co));
                    session.setAttribute("listDishesOrdered", listDishesOrdered);
                    response.sendRedirect(url);
                    return;
                }
            }
        }
    }
%>




