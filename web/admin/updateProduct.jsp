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
    <body class="bg-transparent mt-3">
        
        <%@include file="adminHeader.jsp" %>
        <% 
          if(email.equals("kyawlinn1287@gmail.com")){%>
        
        <div class="container p-5  "  wdith="100%" >
            <h5 class="text-left"><a  class="text-left" href="allProductEdit.jsp"><i class="fas fa-arrow-alt-circle-left"></i> Back</a></h5>
                 
           
              <div class="form text-center">
                <form action="updateProductAction.jsp" method="POST">
                     <%
                            
                            String id=request.getParameter("id");
                            Connection con=ConnectionProvider.getCon();
                            PreparedStatement  pst=con.prepareStatement("select * from product where id = ? ");
                            pst.setString(1,id);
                            ResultSet  rs=pst.executeQuery();
                            
                              while(rs.next())
                              
                              { %>
                    <div class="">
                        <h2>Update Product <hr></h2>
                        <h3 for="id">Product ID:<%=rs.getString("id")%></h3>
                        <input type="hidden" class="id" name="id" value="<%=rs.getString("id")%>""/>
                    </div> 
                    <div class="row">
                        <div class="col-md-6">
                            <div class="">
                                <label for="name">Product Name</label>
                                <input type="text" class="form-control" value="<%=rs.getString("name")%>" name="name" placeholder="Enter Product Name" required=""/>
                            </div>
                            <div class=" mt-3">
                                <label for="category">Enter Category </label>
                                <input type="text" class="form-control" value="<%=rs.getString("category")%>" name="category" placeholder="Enter Product Category" required=""/>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="">
                                <label for="price">Enter Price</label>
                                <input type="text" class="form-control" value="<%=rs.getString("price")%>" name="price" placeholder="Enter Product Price" required=""/>
                            </div>
                            <div class="mt-3">
                                <label for="active">Active</label>
                                <select name="active" class="form-control" value="<%=rs.getString("active")%>" required="" >
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
                      <% }%>  
                </form>
            </div>
               
        </div>
       
        <%}else{%>
        <%@include file="adminError.jsp" %>
        <%}%>
         <%@include file="../footer.jsp" %>
    </body>
   
</html>
