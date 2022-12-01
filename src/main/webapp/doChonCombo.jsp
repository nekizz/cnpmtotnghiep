<%-- 
    Document   : doChonCombo.jsp
    Created on : Nov 29, 2022, 10:52:59 PM
    Author     : ADMIN
--%>

<%@page import="model.ComboOrdered"%>
<%@page import="model.ComboDishes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idFood = request.getParameter("idCombo");
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
    if (isCombo == "true") {
        ArrayList<ComboDishes> listComboDishes = (ArrayList<ComboDishes>) session.getAttribute("listComboDishes");
        if (listComboDishes == null) {
            response.sendRedirect("gdChonBan.jsp");
            return;
        }

        for (ComboDishes cd : listComboDishes) {
            if (cd.getIdComboDishes().contains(idFood)) {
                ArrayList<ComboOrdered> listComboOrdered = null;
                listComboOrdered = (ArrayList<ComboOrdered>) session.getAttribute("listComboOrdered");
                if (listComboOrdered == null) {
                    listComboOrdered = new ArrayList<>();
                    float totalAmount = cd.getPrice() - cd.getDiscount();
                    int soLuongInt = Integer.parseInt(soLuong);
                    listComboOrdered.add(new ComboOrdered(cd.getPrice(), cd.getDiscount(), totalAmount, cd.getNote(), cd, soLuongInt));
                    session.setAttribute("listComboOrdered", listComboOrdered);
//                    response.sendRedirect(url);
//                    return;
                } else {
                    int soLuongInt = Integer.parseInt(soLuong);
                    for (ComboOrdered d : listComboOrdered) {
                        if (d.getComboDishes().equals(cd)) {
                            int oldQuantity = d.getQuantity();
                            d.setQuantity(oldQuantity + soLuongInt);
                            //set total mount nua
                            session.setAttribute("listComboOrdered", listComboOrdered);
                            response.sendRedirect(url);
                            return;
                        }
                    }
                    float totalAmount = cd.getPrice() - cd.getDiscount();
                    listComboOrdered.add(new ComboOrdered(cd.getPrice(), cd.getDiscount(), totalAmount, cd.getNote(), cd, soLuongInt));
                    session.setAttribute("listComboOrdered", listComboOrdered);
                    response.sendRedirect(url);
                    return;
                }
            }
        }
    }
%>


