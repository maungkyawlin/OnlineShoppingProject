<%-- 
    Document   : myOrder
    Created on : Jul 29, 2022, 2:06:09 PM
    Author     : ArakhaLand
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
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 ">
                     <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead >
                        <center>
                            <h1>My Order <i class="fab fa-elementor"></i><hr></h1>
                        </center>
                       
                        </thead>
                        <thead class="bg-dark text-white">
                            <tr>
                                <th>S.No</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Price (ks)</th>
                                <th>Quantity</th>
                                <th>Sub Total (ks)</th>
                                <th>Order Date</th>
                                <th>Expected Delivery Date</th>
                                <th>Payment Method</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  
                             int sno=0;
                            
                           
                          
                            Connection con=ConnectionProvider.getCon();
                            
                           
                            String sql="select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL and status='processing'";
                            PreparedStatement pst=con.prepareStatement(sql);
                           
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){
                          
                            
                        
                        %>
                           
                               
                               
                                
                                <tr> 
                                    <%sno=sno+1;%>
                                    <td><%out.print(sno);%></td>
                                    <td align="left"><%=rs.getString("name")%></td>
                                    <td align="left"><%=rs.getString("category")%></td>
                                    <td align="right"><%=rs.getString("price")%> /ks</td> 
                                    <td align=""><%=rs.getString("quantity")%></td> 
                                    <td align="right"><%=rs.getString("total")%> /ks</td> 
                                    <td align=""><%=rs.getString("orderDate")%></td> 
                                    <td align=""><%=rs.getString("deliDate")%></td>
                                    <td align=""><%=rs.getString("payment")%></td>
                                    <td><%=rs.getString("status")%></td>
                                    
                                </tr>
                        
                           
                         <%} %>
                        </tbody>
                     </table>
                </div>
                <hr class="text-white mt-3" style="border: 2px dashed black;">        
            </div>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
