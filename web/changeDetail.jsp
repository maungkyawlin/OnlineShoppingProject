<%-- 
    Document   : changeDetail
    Created on : Jul 29, 2022, 2:52:40 PM
    Author     : ArakhaLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container mt-3 mb-3">
            <center><h2> My Detail <i class="fas fa-edit"></i><hr></h2></center>
            <div class="row">
               
                <div class="col-md-6 mx-auto">
                      <div  class="mt-3">
                             <a href="changeDetail.jsp" class="btn btn-outline-success">My Profile</a>
                             <a href="changeProfile.jsp" class="btn btn-outline-dark">Change Profile</a>
                        </div>
                    <form class="bg-dark p-3 pb-4 mt-3" style="border-radius:20px; ">
                        <div class="mt-3">
                            <center ><h2 class="text-white">My Profile <i class="fas fa-user-circle"></i><hr></h2></center>
                        </div> 
                        
                   <%
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from sigup where email='"+ email +"' ");
                    while(rs.next()){
                    %>
                        <div class="form-control mt-2">
                            <label for="name">Name: <%=rs.getString("name")%></label>
                        </div>
                         <div class="form-control mt-2">
                            <label for="name">Email: <%out.print(email);%></label>
                        </div>
                        <div  class="form-control mt-2">
                            <label for="name">Password: <%=rs.getString("password")%></label>
                        </div>
                        <div  class="form-control mt-2">
                            <label for="name">Mobile Number: <%=rs.getString("mobile")%></label>
                        </div>
                        <div  class="form-control mt-2">
                            <label for="name">Security Question: <%=rs.getString("securityQuestion")%></label>
                        </div>
                        <div  class="form-control mt-2">
                            <label for="name">Answer: <%=rs.getString("answer")%></label>
                        </div>
                <%}%>   
                        
                    </form>
                        
                   
                    
                </div>
            </div>
            <hr class="text-white mt-3" style="border: 2px dashed black;">
        </div>
        <%@include  file="footer.jsp" %>
    </body>
</html>
