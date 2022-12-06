<%-- 
    Document   : GDDsBan
    Created on : Nov 21, 2022, 10:13:54 PM
    Author     : ADMIN
--%>

<%@page import="java.util.function.Predicate"%>
<%@page import="model.BookedTable"%>
<%@page import="dao.TableDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Table"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <%@include file ="header.jsp" %> 
        <title>Danh sách bàn</title> 
    </head>

    <%
        ArrayList<Table> listTable = null;

        String maBan = request.getParameter("maBan");
        TableDAO dao = new TableDAO();
        ArrayList<String> listIDBookedTableDisplay = (ArrayList<String>) session.getAttribute("listIDBookedTableDisplay");

        if (maBan == null) {
            maBan = "";
            listTable = dao.getAllTable();
        } else {
            listTable = dao.searchTable(maBan);
        }
//        if (listIDBookedTableDisplay != null) {
//            for (String t : listIDBookedTableDisplay) {
//                listTable.removeIf(s -> s.getIdTable().contains(t));
//            }
//        }
        session.setAttribute("listTable", listTable);
    %> 

    <body> 
        <div class="container"> 
            <h2 class="text-primary text-primary" style="text-align: left; margin-top: 20px " > Chọn bàn </h2>            
            <form name="timban" action="gdChonBan.jsp" method="post" style="margin-top: 50px"> 
                <div class="text-center row"> 
                    <div class="col-sm-6 col-md-2"> 
                    </div> 
                    <div class="col-sm-6 col-md-6" style="    display: flex;
                         justify-content: flex-end"> 
                        <input type="text" name="maBan" value="<%=maBan%>" class="form-control" id="maBan" placeholder="Nhập mã bàn..." style="width: 30%"></div> 
                    <div class="col-6 col-md-2"> 
                        <button class="btn btn-primary" type="submit">Tìm kiếm </button> 
                    </div>            
                </div> 
            </form> 

            <table class="table" style="margin-top: 100px"> 
                <thead> 
                    <tr> 
                        <th scope="col">STT</th> 
                        <th scope="col">Số hiệu</th> 
                        <th scope="col">Loại</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Chọn</th> 
                    </tr> 
                </thead> 
                <tbody>                     
                    <%
                        if (listTable != null)
                            for (int i = 0; i < listTable.size(); i++) {
                    %> 
                    <tr> 
                        <th scope="row"><%=(i + 1)%></th> 
                        <td><%=listTable.get(i).getIdTable()%></td> 
                        <td><%=listTable.get(i).getType()%></td> 
                        <td><%=listTable.get(i).getStatus()%></td> 
                        <td><a class="btn btn-success btn-sm"
                               href="doChonBan.jsp?idTable=<%=listTable.get(i).getIdTable()%> ">Chọn</a></td> 
                    </tr> 
                    <%}%> 
                </tbody> 
            </table> 
        </div>
    </body> 
</html>
