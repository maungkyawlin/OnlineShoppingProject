
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
        <%@include file="adminHeader.jsp" %>
        <div class="container p-5">
            <div class="row">
               
                <div  class="col-md-12 col-sm-6 mx-auto">
                     <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                             <center><h1>Users' Messages <i class="fas fa-comment-alt"></i><hr></h1></center>
                        </thead >
                        <thead class="bg-dark text-white">
                        <th>Mss.NO</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Send To <i class="fas fa-share-square"></i></th>
                        <th>Remove <i class="fas fa-trash"></i></th>
                        </thead>
                        <%
                            int mno=0;
                        Connection con=ConnectionProvider.getCon();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from message where id ORDER BY ID DESC  ");
                        while(rs.next()){
                       
                        %>
                        <tbody>
                        <%mno=mno+1;%>
                         <td><%out.print(mno);%></td>
                         <td><%=rs.getString("email")%></td>
                         <td><%=rs.getString("subject")%></td>
                         <td><%=rs.getString("body")%></td>
                         <td><a class="btn btn-outline-dark">Send To <i class="fas fa-share-square"></i></a></td>
                         <td><a class="btn btn-outline-dark">Remove <i class="fas fa-trash"></i></a></td>
                        </tbody>
                         <%   }
                        %> 
                    </table>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
