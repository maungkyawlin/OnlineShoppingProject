

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home  Page</title>
          <link href="../bootstrap/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <link href="../bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cndjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <div class="container p-3">
            <center><h1>Online Shopping Project</h1></center>
        </div>
      <nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container-fluid">
      <%String email=session.getAttribute("email").toString();%>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
      </button>
   <div class="collapse navbar-collapse" id="navbarSupportedContent">
     
      <ul class="navbar-nav mx-auto mb-2 mb-lg-0 "> 
            
          <li class="nav-item">
              <a class="nav-link text-white" aria-current="page" href=""><input type="email" value="<%out.println(email);%>" style="border-radius:20px; text-align: center;"/> <i class="fas fa-user-alt"></i></a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white mt-1" aria-current="page" href="home.jsp">Home <i class="fas fa-home"></i></a>
        </li>
        
        <li class="nav-item">
            <a class="nav-link text-white mt-1" aria-current="page" href="myCart.jsp">My Cart <i class="fas fa-cart-arrow-down"></i></a>
        </li>
         <li class="nav-item">
              <a class="nav-link text-white mt-1" aria-current="page" href="myOrder.jsp"> My Orders <i class="fab fa-elementor"></i></a>
        </li>
         <li class="nav-item">
             <a class="nav-link text-white mt-1" aria-current="page" href="changeDetail.jsp">Changed Details <i class="fas fa-edit"></i></a>
        </li>
        <li class="nav-item">
              <a class="nav-link text-white mt-1" aria-current="page" href="message.jsp">Message Us <i class="fas fa-comment-alt "></i></a>
        </li>
        <li class="nav-item">
              <a class="nav-link text-white mt-1" aria-current="page" href="aboutUs.jsp">About <i class="fas fa-address-book"></i></a>
        </li>
         <li class="nav-item">
              <a class="nav-link text-white mt-1" aria-current="page" href="logout.jsp">logout <i class="fas fa-share-square"></i></a>
        </li>
       
      </ul>

        <form class="d-flex" action="searchHome.jsp" method="POST">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search"  />
            <button class="btn btn-outline-info" type="submit"> Search</button>
        </form>
    </div>
  </div>
</nav>
      
        <script src="../bootstrap/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../bootstrap/bootstrap/js/bootstrap.min.js" type="text/javascript"> </script>
       
    </body>
</html>
