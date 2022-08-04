<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");

try{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+id+"'");
response.sendRedirect("myCart.jsp?msg=removed");
    }catch(Exception e){
    out.print(e);
    
    }

%>