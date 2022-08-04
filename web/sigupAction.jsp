<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>
<%
    
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String mobile=request.getParameter("mobile");
    String securityQuestion=request.getParameter("securityQuestion");
    String answer=request.getParameter("answer");
     //String country=request.getParameter("country");
    
try{
  Connection con=ConnectionProvider.getCon();
  PreparedStatement ps=con.prepareStatement("insert into sigup(name,email,password,mobile,securityQuestion,answer) values(?,?,?,?,?,?)");
  ps.setString(1,name);
  ps.setString(2,email);
  ps.setString(3,password);
  ps.setString(4,mobile);    
  ps.setString(5,securityQuestion);
  ps.setString(6,answer); 
  ps.executeUpdate();
  
  response.sendRedirect("Signup.jsp?msg=vaild");
  
    }catch(Exception e){
    
     out.println(e);
      response.sendRedirect("Signup.jsp?msg=invaild");
    }
    
 %>
 
 
 