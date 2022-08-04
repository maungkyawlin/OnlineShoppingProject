<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
         <link href="bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .erro{
                background-color: gray;
              padding-bottom: 20px;
              
            } 
            h3{
                color:darkred;
                text-align: center;
                
            }
            p{
                color:white;
                text-align: center;
                
            }
            a{
                color:white;
                text-align: center;
            }
        </style>
    </head>
    <body class="p-0">
        <div class="erro">
        <h3>Sorry! Something went Wrong!</h3>
        <h3>So go for login! Try Again!</h3>
        <p><a href="login.jsp" class="text-center">Login</a></p>
        </div>
    </body>
</html>
