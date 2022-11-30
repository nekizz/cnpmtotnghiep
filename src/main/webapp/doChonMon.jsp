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
    if (idFood == "" && soLuong == "") {
        response.sendRedirect("gdChonMon.jsp?idkh=BC1");
        return;
    }
    String isCombo = (String) session.getAttribute("isCombo");
    if (isCombo == "true") {
        ArrayList<ComboDishes> listCombo = (ArrayList<ComboDishes>) session.getAttribute("listComboDishes");
        ArrayList<ComboOrdered> listComboOrdered = new ArrayList<>();
        if (listCombo == null) {
        return;
    }
    for (ComboDishes co : listCombo) {
        if (co.getIdComboDishes().contains(idFood)) {
            float totalAmount = co.getPrice() - co.getDiscount();
            int soLuongInt = Integer.parseInt(soLuong);
            listComboOrdered.add(new ComboOrdered(co.getPrice(), co.getDiscount(), totalAmount, co.getNote(), co, soLuongInt));
            session.setAttribute("listComboOrdered", listComboOrdered);

                return;
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
        <h1><%=idFood%></h1>
    </body>
</html>

<script>
</script>

