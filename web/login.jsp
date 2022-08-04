<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page import=" java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Signup Page</title>

        <link href="bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cndjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <style>
            .pass_show{position: relative} 

.pass_show .ptxt { 

       position: absolute; 

       top: 50%; 

       right: 10px; 

       z-index: 1; 

       color: #f36c01; 

      margin-top: -3px; 

    cursor: pointer; 

transition: .3s ease all; 

} 

.pass_show .ptxt:hover{color: #333333;} 
        </style>

        <!-- //bootstrap -->
    </head>
    <body class="">
        <nav class="navbar navbar-brand bg-dark mt-3 ">
            <div class="container">
                <h1><a class="navbar-brand text-white">Online Shopping Project</a></h1>
                <form class="d-flex" action="search.jsp">
                   <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="course">
                  <button class="btn btn-outline-info" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <div class="container-fluid  p-5" >
            <!-- Form -->
       <div class="card mb-3 mx-auto " style="max-width:50%; ">
        <div class="row g-0 border-0  bg-dark text-white " >
            <div class="col-sm-6">
                <div class="card border-0 bg-dark" ">
                    <div class="card-body ">
                        <form action="loginAction.jsp"  method="POST" class="img-fluid rounded-start bg-dark" id="myform">
                            <div class=" m-2">
                                <h2 class="text-center">Login Form</h2>
                            </div>
                            
                            <div class=" m-2">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required />
                             </div>
                             <div class="m-2 form-group pass_show">
                                <label for="password">Password:</label>
                                <input type="password" name="password" class="form-control"  value="Enter Your Password" required> 
                            </div>
                            <div  class="m-2" >
                                <button type="submit" class="btn btn-outline-info">Login <i class="far fa-arrow-alt-circle-right"></i></button>
                                
                                
                                <p class=""><a href="forgotPassword.jsp" align="right">Forgot password!</a>
                                    <b><a href="Signup.jsp" class="btn btn-outline-secondary" >Signup</a></b></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 mt-5">
                <%
                  String msg=request.getParameter("msg");
                  if("notexist".equals(msg)){
                  %>
                  <h1 class="text-warning">Incorrect User name or password.Please Check Again!</h1>
                 
                <%
                 }  
                  if("invaild".equals(msg)){
                %>
                <h3 class="text-danger">Something went Wrong! Try Again! </h3>
                <%
                 }
                %>  
                

             <h4 class="mt-4">Online Shopping</h4>
             <p>The online shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
                        
                </div>
            </div>
           <!-- end Form -->
       </div>
        
        </div>


        <script src="bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"> </script>
        <script>
            $(document).ready(function(){
           $('.pass_show').append('<span class="ptxt">Show</span>');  
             });
  

           $(document).on('click','.pass_show .ptxt', function(){ 

          $(this).text($(this).text() == "Show" ? "Hide" : "Show"); 

           $(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 

                });  
        </script>
           
        <%@include file="footer.jsp" %>

    </body>
</html>
