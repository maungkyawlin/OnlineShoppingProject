

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
        <%@include file="adminHeader.jsp" %>
        <div class="container-fluid p-5">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                        <center><h1>Delivered Order <i class="fas fa-dolly"></i></h1><hr></center>
                        </thead>
                       <thead class="bg-dark text-white">
                        <th>Order.NO</th>
                        <th>Email</th>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Address</th>
                        <th>Mobile</th>
                        
                        <th>T-ID</th>
                        <th>Payment Method</th>
                        
                        <th>Order Date</th>
                        <th>Expected Date</th>
                       
                        
                        </thead>
                         <%
                        String msg=request.getParameter("msg");
                        if("cancle".equals(msg)){%>
                        <script>
                            alert("Your Data Cancle Successfully");
                        </script>
                        <%}
                       if("delivery".equals(msg)){%>
                        <script>
                            alert("Your Data Delivery Successfully");
                        </script>
                        <%}if("worng".equals(msg)){
                        %>
                        <script>
                            alert("Something Worn! Cann't delete data.");
                        </script>
                        <%}
                        if("update".equals(msg)){%>
                        <script>
                            alert("Your data Update Successfully!");
                        </script>
                        <%}%>
                        <tbody>
                            <%  
                               
                             int sno=0;
                            
                           
                        try{  
                            Connection con=ConnectionProvider.getCon();
                            
                           
                            String sql="select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivery'";
                            PreparedStatement ps=con.prepareStatement(sql);
                            ResultSet rs=ps.executeQuery();
                             
                           while(rs.next()){
                          
                            
                        
                        %>
                           
                               
                             <tr> 
                                    <%sno=sno+1;%>
                                    <td><%out.print(sno);%></td>
                                    <td><%=rs.getString("email")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("category")%> </td> 
                                    <td><%=rs.getString("price")%></td> 
                                    <td><%=rs.getString("quantity")%></td> 
                                    <td><small><%=rs.getString("address")%>, <%=rs.getString("city")%>, <%=rs.getString("state")%>, <%=rs.getString("country")%><small></td> 
                                    <td><%=rs.getString("mobile")%></td>
                                    <td><%=rs.getString("transation")%></td>
                                    <td><%=rs.getString("payment")%></td>
                                    <td><%=rs.getString("deliDate")%></td>
                                    <td><%=rs.getString("orderDate")%></td>
                                    
                                    
                                </tr>  
                                
                                
                        
                           
                         <%}
                             }catch(Exception e){
                             out.print(e);
                           }%>
                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
