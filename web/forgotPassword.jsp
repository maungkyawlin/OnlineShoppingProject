

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
    <body>
        <nav class="navbar navbar-light bg-dark mt-3">
            <div class="container">
                <h1><a class="navbar-brand text-white" >Online Shopping Project</a></h1>
                <form class="d-flex" action="search.jsp">
                   <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="course">
                  <button class="btn btn-outline-info" type="submit">Search</button>
                </form>
            </div>
        </nav>
        <div class="container-fluid  p-5" >
            <!-- Form -->
       <div class="card mb-3 mx-auto" style="max-width:50%; ">
        <div class="row g-0 border-0 bg-dark text-white">
            <div class="col-sm-6">
                <div class="card border-0 bg-dark ">
                    <div class="card-body ">
                        <form action="forgotPasswordAction.jsp"  method="POST" class="img-fluid rounded-start" id="myform">
                            <div class=" m-2">
                                <h2 class="text-center">Reset Password Form</h2>
                            </div>
                           
                            <div class=" m-2">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required />
                             </div>
                            
                            <div class=" m-2">
                                
                                <label for="mobile">Mobile:</label>
                               
                              <input type="number"class="form-control" name="mobile" placeholder="Enter Your Mobile Number" required />
                             </div>
                            <div class=" m-2">
                                <label for="select">Security Question:</label>
                                <select name="securityQuestion" required="" class="form-control">
                                    <option value="What was your first car?">What was your first car?</option>
                                    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                                    <option value="What elementary school did you attend?">What elementary school did you attend?</option>
                                    <option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
                                </select>
                            </div>
                           <div class=" m-2">
                                <label for="answer">Answer:</label>
                                <input type="text" class="form-control" name="answer" placeholder="Enter Your Answer" required />
                            </div>
                            <div class="m-2 form-group pass_show">
                                <label for="password">*New Password:</label>
                                <input type="password" name="newpassword" class="form-control" value="Enter Your New Password" required> 
                            </div>
                            <div  class="m-2" >
                               <button type="submit" class="btn btn-outline-info">Reset Password <i class="far fa-arrow-alt-circle-right"></i></button>
                                
                               
                                <h4 style="" class="m-2"><a href="login.jsp" >Login</a></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 mt-5">
                    <%
                    String msg=request.getParameter("msg");
                    if("vaild" .equals(msg)){
                    %>
                    <h1 class="text-success">Changed New Password Successfully!</h1>
                 
                    <%
                      }
                    if("invaild".equals(msg)){
                    %>
                    <h1 class="text-danger">Something went wrong! Try Again!</h1>
                 
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
           
    
        <%@include  file="footer.jsp" %>
    </body>
</html>
