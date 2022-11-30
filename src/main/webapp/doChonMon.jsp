<%-- 
    Document   : chonMon.jsp
    Created on : Nov 29, 2022, 10:52:47 PM
    Author     : ADMIN
--%>

<%@page import="model.ComboOrdered"%>
<%@page import="model.ComboDishes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idFood = request.getParameter("idMon");
    String soLuong = request.getParameter("soLuong");
    String maBan = (String)session.getAttribute("maBan");
    ArrayList<ComboOrdered> listComboOrdered = new ArrayList<>();
    if (maBan == "") {
        response.sendRedirect("gdChinhNV.jsp");
        return;
    }
    String url = "gdChonMon.jsp?idkh" + maBan;
    if (idFood == "" && soLuong == "") {
        response.sendRedirect(url);
        return;
    }
    String isCombo = (String) session.getAttribute("isCombo");
    if (isCombo == "true") {
        ArrayList<ComboDishes> listCombo = (ArrayList<ComboDishes>) session.getAttribute("listComboDishes");

        if (listCombo == null) {
            return;
        }
        for (ComboDishes co : listCombo) {
            if (co.getIdComboDishes().contains(idFood)) {
                float totalAmount = co.getPrice() - co.getDiscount();
                int soLuongInt = Integer.parseInt(soLuong);
                listComboOrdered.add(new ComboOrdered(co.getPrice(), co.getDiscount(), totalAmount, co.getNote(), co, soLuongInt));
                session.setAttribute("listComboOrdered", listComboOrdered);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>?Minhy</h1>
    </body>
</html>

<script>
</script>

