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
    int soLuongInt = Integer.parseInt(soLuong);
    if (idFood == "" || soLuong == "" || soLuongInt == 0) {
        response.sendRedirect(url);
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
//                    ComboOrderedDAO dao = new ComboOrderedDAO();
//                    ComboOrdered comboOrdered = dao.createComboOrdered(cd, soLuongInt);
//                    listComboOrdered.add(comboOrdered);
                    float totalAmount = cd.getPrice()*soLuongInt - cd.getDiscount();
                    listComboOrdered.add(new ComboOrdered(cd.getPrice(), cd.getDiscount(), totalAmount, cd.getNote(), cd, soLuongInt));
                    session.setAttribute("listComboOrdered", listComboOrdered);
                    response.sendRedirect(url);
                    return;
                } else {
                    for (ComboOrdered d : listComboOrdered) {
                        if (d.getComboDishes().getIdComboDishes().equals(cd.getIdComboDishes())) {
                            int oldQuantity = d.getQuantity();
                            d.setQuantity(oldQuantity + soLuongInt);
                            float oldTotalAmount = d.getTotalAmount();
                            d.setTotalAmount(soLuongInt*d.getPrice()+oldTotalAmount);
                            //set total mount nua
                            session.setAttribute("listComboOrdered", listComboOrdered);
                            response.sendRedirect(url);
                            return;
                        }
                    }
                    float totalAmount = cd.getPrice()*soLuongInt - cd.getDiscount();
                    listComboOrdered.add(new ComboOrdered(cd.getPrice(), cd.getDiscount(), totalAmount, cd.getNote(), cd, soLuongInt));
//                    ComboOrderedDAO dao = new ComboOrderedDAO();
//                    ComboOrdered comboOrdered = dao.createComboOrdered(cd, soLuongInt);
//                    listComboOrdered.add(comboOrdered);
                    session.setAttribute("listComboOrdered", listComboOrdered);
                    response.sendRedirect(url);
                    return;
                }
            }
        }
    }
%>


