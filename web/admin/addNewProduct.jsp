<%-- 
    Document   : addNewProduct
    Created on : Jul 18, 2022, 2:36:41 PM
    Author     : ArakhLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider" %>
<%@page  import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Product Page</title>
    </head>
    <body class=" mt-3">
        
        <%@include file="adminHeader.jsp" %>
        
     <% if(email.equals("kyawlinn1287@gmail.com")){%>
          
        <div class="container p-5  text-center"  wdith="100%" >
             <%
            String msg=request.getParameter("msg");
            if("vaild".equals(msg)){
            %>
            
            <h1 class="text-success">Add Product Successfully!</h1>
            
            <%}
             if("invaild".equals(msg)){
            %>
            <h1 class="text-danger">Sorry Something went Wrong! Try Again!</h1>
            <%}%>
            <%
            int id=1;
            try{
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select max(id) from product ");
            
            while(rs.next()){
            id=rs.getInt(1);
            id=id+1;
            
                }
            
                }catch( Exception e){
                
                }
            
            %>
           
            <div class="form">
                <form action="newProductAction.jsp" method="POST">
                    <center>
                        <h1>Add New Product</h1>
                    </center>
                    <div class="">
                        <h3 for="id" class="text-info">Product ID:<%out.println(id);%></h3>
                        <input type="hidden" class="id" name="id" value="<% out.println(id);%>"/>
                    </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="">
                                <label for="name">Product Name</label>
                                <input type="text" class="form-control" name="name" placeholder="Enter Product Name" required=""/>
                            </div>
                            <div class=" mt-3">
                                <label for="category">Enter Category </label>
                                <input type="text" class="form-control" name="category" placeholder="Enter Product Category" required=""/>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="">
                                <label for="price">Enter Price</label>
                                <input type="text" class="form-control" name="price" placeholder="Enter Product Price" required=""/>
                            </div>
                            <div class="mt-3">
                                <label for="active">Active</label>
                                <select name="active" class="form-control" required="">
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-6 bg-dark mx-auto " style="border-radius: 40px;">
                                <button type="submit" class="btn btn-outline-info m-3 mx-4"> Save <i class="far fa-arrow-alt-circle-right"></i></button>
                                <button type="reset" class="btn btn-outline-danger m-3 ">Reset <i class="far fa-window-close"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
               
        </div>
                        <%}else{%>
                        <%@include file="adminError.jsp" %>
                        
                        <%}%>
        
         <%@include file="../footer.jsp" %>
    </body>
   
</html>
