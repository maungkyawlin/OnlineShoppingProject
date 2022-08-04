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
  try{
 Connection con=ConnectionProvider.getCon();
 
 PreparedStatement pst=con.prepareStatement("delete from product where id=?");
 
 pst.setString(1, id);
 pst.executeUpdate();
 response.sendRedirect("allProductEdit.jsp?msg=delete");
    }
    
    catch(Exception e){
    out.print(e);
    response.sendRedirect("allProductEdit.jsp?msg=non");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- Bootstrap link -->
        <link href="bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- //bootstrap -->
    </head>
    <body>
        
    </body>
</html>
