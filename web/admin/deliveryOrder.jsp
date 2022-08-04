<%-- 
    Document   : delete
    Created on : Jun 6, 2022, 2:10:52 PM
    Author     : IT(ERA)
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivery";
try{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
st.executeUpdate("update cart set status='"+ status +"' where product_id='"+ id +"' and email='"+email+"' and address is not NULL");
response.sendRedirect("orderReceived.jsp?msg=delivery");

    }catch(Exception e){
    out.print(e);
    response.sendRedirect("orderReceived.jsp?msg=worng");
    }
  
  
  
%>