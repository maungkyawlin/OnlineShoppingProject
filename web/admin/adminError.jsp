<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
         <link href="../bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <link href="../bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .erro{
                background-color: gray;
               padding-bottom: 50px;
              
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
            }
        </style>
    </head>
    <body class="p-0">
        <div class="erro">
        <h3 class="">Sorry! Your are not Admin!</h3>
        <h3>So You can buy Products from my Online Shopping by  User Account! This is For Admin!</h3>
        <p><a href="../login.jsp">Login</a></p>
        </div>
    </body>
</html>
