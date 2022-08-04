<%-- 
    Document   : updateProductAction
    Created on : Jul 19, 2022, 4:19:20 PM
    Author     : ArakhLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page  import="java.sql.*" %>



<%
  
  
  
  
 
  String name=request.getParameter("name");
  String category=request.getParameter("category");
  String price=request.getParameter("price");
  String active=request.getParameter("active"); 
  String id=request.getParameter("id");
  
 try{
 Connection con=ConnectionProvider.getCon();
 PreparedStatement pst=con.prepareStatement("update product set  name=?,category=?,price=?,active=? where id=?");
 pst.setString(1, name);
 pst.setString(2, category);
 pst.setString(3, price);
 pst.setString(4, active);
 pst.setString(5, id);
 pst.executeUpdate();
 
 if(active.equals("No")){
 
      pst.executeUpdate("delete from cart where product_id='"+ id +"' and address is NULL");
 
    }
 response.sendRedirect("allProductEdit.jsp?msg=update");
 
    }
    catch(Exception e){
    out.println(e);
    response.sendRedirect("updateProduct.jsp");
    }
%>


