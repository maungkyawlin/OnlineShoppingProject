<%-- 
    Document   : message
    Created on : Jul 29, 2022, 5:38:11 PM
    Author     : ArakhaLand
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="header.jsp" %>
        <div class="container p-5 ">
            <center><h2>Message Us <i class="fas fa-comment-alt "></i> <hr></h2></center>
            <div class="row">
                <div class="col-md-6 mx-auto bg-dark text-white p-5" style="border-radius: 20px;" >
                     <%
                    String msg=request.getParameter("msg");
                    if("vaild" .equals(msg)){
                    %>
                    <h5 class="text-success text-center">Your send message successfully!</h5>
                 
                    <%
                      }
                    if("invaild".equals(msg)){
                    %>
                    <h5 class="text-danger text-center">Something went wrong! Try Again!</h5>
                 
                    <%
                      }
                    %>
                    <form action="messageAction.jsp" method="POST" class="mx-auto">
                        <div class="mt-3">
                            <label for="subject">Subject</label>
                            <input class="form-control" type="text" name="subject" placeholder="Enter Subject"/>
                        </div>
                        <div class="mt-3">
                            <label for="subject">Message</label>
                            <textarea class="form-control" name="body" placeholder="Enter Text"></textarea>
                        </div>
                        <div class="mt-3">
                            
                            <button class="btn btn-outline-info" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>
                        </div>
                    </form>
                </div>
                <hr class="text-white mt-3" style="border: 2px dashed black;">
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
