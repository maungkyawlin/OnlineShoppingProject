

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
        <%@include file="header.jsp" %>
        <div class="container  p-5" >
            <!-- Form -->
       <center><h2> My Detail <i class="fas fa-edit"></i><hr></h2></center>
        <div class="row ">
            <div class="col-md-10 mx-auto">
                <div  class="mt-3">
                             <a href="changeDetail.jsp" class="btn btn-outline-dark">My Profile</a>
                             <a href="changeProfile.jsp" class="btn btn-outline-success">Change Profile</a>
                </div>
                <div class="mt-3">
                    <%@include file="changeProfileDetail.jsp" %>
                </div>
                <div class="card border-0 bg-dark  text-white mt-3" style="border-radius: 20px;">
                    <div class="card-body ">
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
                        <form action="changeProfileAction.jsp"  method="POST" class="img-fluid rounded-start " id="myform" >
                            <div class=" m-2">
                                <h2 class="text-center"> Change Profile <i class="fas fa-user-circle"></i> <hr></h2>
                            </div>
                             
                             <div class=" m-2">
                                <label for="name">*New Name:</label>
                                <input type="text" class="form-control" name="newname" placeholder="Change Your Name" required />
                            </div>
                           
                            
                            <div class=" m-2">
                                
                                <label for="mobile">*New Mobile:</label>
                               
                              <input type="number"class="form-control" name="newmobile" placeholder="Change Your Mobile Number" required />
                             </div>
                            <div class=" m-2">
                                <label for="select">*New Security Question:</label>
                                <select name="newsecurityQuestion" required="" class="form-control" placeholder="">
                                    <option value="">Change Your Security Question</option>
                                    <option value="What was your first car?">What was your first car?</option>
                                    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                                    <option value="What elementary school did you attend?">What elementary school did you attend?</option>
                                    <option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
                                </select>
                            </div>
                           <div class=" m-2">
                                <label for="answer">*New Answer:</label>
                                <input type="text" class="form-control" name="newanswer" placeholder="Change Your Answer" required />
                            </div>
                            <div class="m-2 form-group pass_show">
                                <label for="password">*New Password:</label>
                                <input type="password" name="newpassword" class="form-control" value="Change Your Password" required> 
                            </div>
                            <div  class="m-2" >
                               <button type="submit" class="btn btn-outline-info">Change Detail <i class="far fa-arrow-alt-circle-right"></i></button>
                               
                               
                                <h4 style="" class="m-2"><a href="logout.jsp" >Logout</a></h4>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
           <!-- end Form -->
           <hr class="text-white mt-3" style="border: 2px dashed black;">
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
