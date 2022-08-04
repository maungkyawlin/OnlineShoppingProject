
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>

<%
String name=request.getParameter("name");  
String email=request.getParameter("email");
String password=request.getParameter("password");

if("kyawlinn1287@gmail.com".equals(email) && "*1278linn*".equals(password)){

  session.setAttribute("email",email);

  response.sendRedirect("admin/adminHome.jsp");

    }
    else{
     int z=0;
    try{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from sigup where email='"+ email +"' and password='"+ password +"' ");
    while(rs.next()){
    
     z=1;
     session.setAttribute("email",email);
     response.sendRedirect("home.jsp");
    
    }
   if(z==0)
   response.sendRedirect("login.jsp?msg=notexist");
    
    
    
    }catch(Exception e){
    
    out.println(e);
    response.sendRedirect("login.jsp?msg=invaild");
    }
    
    }
%>
