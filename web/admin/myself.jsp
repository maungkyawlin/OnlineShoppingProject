<%-- 
    Document   : newProductAction
    Created on : Jul 19, 2022, 1:44:37 PM
    Author     : ArakhLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
    String title=request.getParameter("title");
    String description=request.getParameter("description");
    
    try{
    Connection con=ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement("insert into about(id,title,description) values(?,?,?)");
    ps.setString(1,id);
    ps.setString(2,title);
    ps.setString(3,description);
   
    ps.executeUpdate();
    
    response.sendRedirect("adminHome.jsp?msg=vaild");
    
    }catch(Exception e){
    out.println(e);
    
    }
%>