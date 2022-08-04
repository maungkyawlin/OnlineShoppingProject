<%-- 
    Document   : adminHome
    Created on : Jul 15, 2022, 5:11:13 PM
    Author     : ArakhLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class=" mt-3 ">
        <%@include file="adminHeader.jsp" %>
        <% 
        if(email.equals("kyawlinn1287@gmail.com")){%>
        
        <div class="container p-5">
            <div class="row">
                <div class="col-md-6 mx-auto bg-dark " style="border-radius: 20px;">
                    
             <%
            String msg=request.getParameter("msg");
            if("vaild".equals(msg)){
            %>
            
            <h1 class="text-success">Add Description Successfully!</h1>
            
            <%}
             if("invaild".equals(msg)){
            %>
            <h1 class="text-danger">Sorry Something went Wrong! Try Again!</h1>
            <%}%>
            <form action="myself.jsp" class="mb-3" method="POST" enctype="multipart/form-data">
                        <div class="mt-3">
                            <h4 class="text-center text-white">Here! Write You  want to Described for User.  </h4>
                        </div>
                        <div class="mt-3">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" name="title" placeholder="Enter Your Title" required=""/>
                        </div>
                          <div class="mt-3">
                            <label for="title">Title</label>
                            <textarea type="text" class="form-control" name="description" placeholder="Enter Your Description" required=""></textarea>
                        </div>
                         
                        <div class="mt-3 text-center">
                            <button class="btn btn-outline-info" type="submit" >Post</buton>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%}else{%>
        <%@include file="adminError.jsp" %>
        <%}%>
        <%@include file="../footer.jsp" %>
    </body>
</html>
