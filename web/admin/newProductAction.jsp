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
    String name=request.getParameter("name");
    String category=request.getParameter("category");
    String price=request.getParameter("price");
    String active=request.getParameter("active");
    try{
    Connection con=ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement("insert into product(id,name,category,price,active) values(?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,name);
    ps.setString(3,category);
    ps.setString(4,price);
    ps.setString(5,active);
    ps.executeUpdate();
    
    response.sendRedirect("addNewProduct.jsp?msg=vaild");
    
    }catch(Exception e){
    out.println(e);
    response.sendRedirect("addNewProduct.jsp?msg=invaild");
    }
%>