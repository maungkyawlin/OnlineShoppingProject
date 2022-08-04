<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>
<%
    
    
    String email=session.getAttribute("email").toString();
    String newname=request.getParameter("newname");
    String newmobile=request.getParameter("newmobile");
    String newsecurityQuestion=request.getParameter("newsecurityQuestion");
    String newanswer=request.getParameter("newanswer");
    String newpassword=request.getParameter("newpassword");
    
    int x=0;
 try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from sigup where email='"+ email +"' ");
      while(rs.next()){
    
        x=1;
       st.executeUpdate("update sigup set name='"+ newname +"',mobile='"+ newmobile +"',securityQuestion='"+ newsecurityQuestion +"', answer='"+ newanswer +"', password='"+ newpassword +"' where email='"+ email +"'");
       response.sendRedirect("changeProfile.jsp?msg=vaild");
     
       }
    if(x==0){
    response.sendRedirect("changeProfile.jsp?msg=invaild");
    }
  
    }catch(Exception e){
     out.println(e);
    
    }
    
 %>
 
 
 