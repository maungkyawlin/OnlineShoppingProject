<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String payment=request.getParameter("payment");

String mobile=request.getParameter("mobile");
String transation="";
transation=request.getParameter("transation");
String status="bill";

try{
   Connection con= ConnectionProvider.getCon();
   PreparedStatement pst=con.prepareStatement("update sigup set address=?,city=?,state=?,country=?,mobile=? where email='"+email+"' ");
   pst.setString(1, address);
   pst.setString(2, city);
   pst.setString(3, state);
   pst.setString(4, country);
   pst.setString(5, mobile);
   
   pst.executeUpdate();
   
   PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?, state=?,country=?,mobile=?,orderDate=now(),deliDate=DATE_ADD(orderDate,INTERVAL 7 DAY),payment=?,transation=?,status=? where email='"+email+"' and address is NULL");
    ps1.setString(1, address);
    ps1.setString(2, city);
    ps1.setString(3, state);
    ps1.setString(4, country);
    ps1.setString(5, mobile);
    ps1.setString(6, payment);
    ps1.setString(7, transation);
    ps1.setString(8, status);
   
    ps1.executeUpdate();
    response.sendRedirect("bill.jsp");
    }catch(Exception e){
    out.println(e);
    response.sendRedirect("addressPaymentOrder.jsp");
    }

%>