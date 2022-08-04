

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
        <div class="container p-5 ">
            <div class="row">
                <center><h1>About Us <i class="fas fa-address-book"></i> <hr></h1></center>
                <div class="col-md-6 ">
                     <%
                         
                     Connection con=ConnectionProvider.getCon();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from about where id ORDER BY ID DESC");
                     while(rs.next()){
                     %>
                     <h2><%=rs.getString("title")%></h2>
                     <p><%=rs.getString("description")%></p>
                     <%   }
                     %>
                     
                </div>
                <hr>
            </div>
        </div>
       
        <%@include  file="footer.jsp" %>
    </body>
</html>
