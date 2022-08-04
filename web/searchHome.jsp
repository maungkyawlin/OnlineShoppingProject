<%-- 
    Document   : allProductEdit.jsp
    Created on : Jul 19, 2022, 3:20:51 PM
    Author     : ArakhLand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                        <center>
                            <h1>Home Page  <i class="fas fa-home"></i><hr></h1>
                        </center>
                        </thead>
                        <thead  class="bg-dark text-white">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price (ks)</th>
                               
                                <th scope="col">Add To Cart <i class="fas fa-cart-arrow-down"></i></th>
                                
                                
                            </tr>
                        </thead>
                        <%
                        String msg=request.getParameter("msg");
                        if("added".equals(msg)){%>
                        <script>
                            alert("Product added Successfully");
                        </script>
                        <%}if("exist".equals(msg)){
                        %>
                        <script>
                            alert("Product already exist in your cart. Quantity increased!");
                        </script>
                        <%}
                        if("invaild".equals(msg)){%>
                        <script>
                            alert("Something went Wrong! Try Again!");
                        </script>
                        <%}%>
                        <% 
                             int total=0;
                             int start=0;
                             int recordCount=5;
                            int pgno=request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
                            start=pgno*recordCount;
                            Connection con=ConnectionProvider.getCon();
                            String search=request.getParameter("search");
                            String sql="select * from product where name like'%"+ search +"%' or category like'%"+ search + "%' and active='Yes' ORDER BY id ASC  LIMIT ?,? ";
                            PreparedStatement pst=con.prepareStatement(sql);
                            pst.setInt(1,start);
                            pst.setInt(2,recordCount);
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){
                          String id=rs.getString("id");
                        %>
                               
                               
                                
                                <tr> 
                                  
                                    <td><%=rs.getInt("id")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("category")%></td>
                                    <td><%=rs.getString("price")%> /ks</td> 
                                    <td><button class="btn btn-outline-info "><a class="text-decoration-none " href="addCart.jsp?id=<%=rs.getInt("id")%>"> Add to Cart  <i class="fas fa-cart-arrow-down"></a></button></td> 
                                    
                                </tr>
                        
                           
                         <%}

                           String sql1="select count(*) from product where name like'%"+ search +"%' or category like'%"+ search + "%' and active='Yes' ";
                           PreparedStatement pst1=con.prepareStatement(sql1);
                           ResultSet rs2=pst1.executeQuery();
                            
                                 if(rs2.next()){
                                    total=rs2.getInt(1);
                                   }
                        con.close();
                        pst.close();
                        
                        
                        %>
                       
                            <tr>
                            
                                <th colspan="7" class="p-0">
                                    <table width="100%" class="mt-3 ">
                                        <tr>
                                           
                                          <%
                                           for(int i=0;i<=total/recordCount;i++){ %>
                                       
                                             <td> 
                                                 <a href="home.jsp?pgno=<%=i%>" class="btn btn-dark mb-3">Page<%=i+1%></a>
                                            </td>
                                           <% }%>
                                           
                                        </tr>
                                        <tr >
                                            <td colspan="7" class=" bg-dark  p-2 text-white "> Result Product: ( <%=total%> )</td>
                                        </tr>
                                     </table> 
                                </th>
                            </tr>
                   
                            
                    </table>
                  
                </div>
            </div>
        </div>
        
        <%@include file="../footer.jsp" %>
    </body>
</html>
