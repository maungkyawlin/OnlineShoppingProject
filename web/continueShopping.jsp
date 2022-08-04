<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
Connection con=ConnectionProvider.getCon();
PreparedStatement pst=con.prepareStatement("update cart set status=? where email=? and status='bill'");
pst.setString(1, status);
pst.setString(2, email);
pst.executeUpdate();
response.sendRedirect("home.jsp");
    }catch(Exception e){
    out.print(e);
    }
%>

