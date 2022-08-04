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
        <%@include  file="header.jsp" %>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                        <center>
                            <h1>Home Page  <i class="fas fa-home"></i><hr></h1>
                        </center>
                        </thead>
                        <thead  class="bg-dark text-white ">
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
                        <h1 class="text-success text-center" >Product added Successfully!</h1>
                        <%}if("exist".equals(msg)){
                        %>
                        <h1 class="text-warning text-c">This product already exist here.So increased quantity!</h1>
                        <%}
                        if("invaild".equals(msg)){%>
                        <h1 class="text-danger text-center">Sorry Something went wrong! Try again!.</h1>
                        <%}%>
                        <% 
                             int sno=0;
                             int total=0;
                             int start=0;
                             int recordCount=5;
                           int pgno=request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
                            start=pgno*recordCount;
                          
                            Connection con=ConnectionProvider.getCon();
                            String sql="select * from product where active='Yes' ORDER BY id DESC  limit ?,? ";
                            PreparedStatement pst=con.prepareStatement(sql);
                            pst.setInt(1,start);
                            pst.setInt(2,recordCount);
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){
                        
                        %>
                           
                               
                               
                                
                                <tr> 
                                     <%sno=sno+1;%>
                                     <td class="" align=""><%out.println(sno);%></td>
                                     <td class="" align="left"><%=rs.getString("name")%></td>
                                    <td align="left"><%=rs.getString("category")%></td>
                                    <td align="right"><%=rs.getString("price")%> /ks</td> 
                                    <td><button class="btn btn-dark "><a class="text-decoration-none text-white " href="addToCartAction.jsp?id=<%=rs.getString("id")%>"> Add to Cart  <i class="fas fa-cart-arrow-down"></a></button></td> 
                                    
                                </tr>
                        
                           
                         <%} 

                           String sql1="select count(*) from product";
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
                                                 <a href="home.jsp?pgno=<%=i%>" class="btn btn-dark mb-3">Page <%=i+1%></a>
                                            </td>
                                           <% }%>
                                           
                                        </tr>
                                        <tr >
                                            <td colspan="7" class=" bg-dark  p-2 text-white "> Total Product: ( <%=total%> )</td>
                                        </tr>
                                     </table> 
                                </th>
                            </tr>
                   
                            
                    </table>
                  
                </div>
                <hr class="text-white mt-3" style="border: 2px dashed black;">
            </div>
                                        
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
