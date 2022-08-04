<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>
<%
    
    
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String securityQuestion=request.getParameter("securityQuestion");
    String answer=request.getParameter("answer");
    String newpassword=request.getParameter("newpassword");
    
    int x=0;
 try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from sigup where email='"+ email +"' and mobile='"+ mobile +"' and securityQuestion='"+ securityQuestion +"' and answer='"+ answer +"' ");
      while(rs.next()){
    
        x=1;
       st.executeUpdate("update sigup set password='"+ newpassword +"' where email='"+ email +"'");
       response.sendRedirect("forgotPassword.jsp?msg=vaild");
     
       }
    if(x==0){
    response.sendRedirect("forgotPassword.jsp?msg=invaild");
    }
  
    }catch(Exception e){
     out.println(e);
    
    }
    
 %>
 
 
 