
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            if(window.history.forward(1) !=null){
                window.history.forward(1);
                
            }
        </script>
    </head>
    <body>
        <%@include  file="header.jsp" %>
      
        <div class="container p-5">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                        <center>
                            <h1>My Cart <i class="fas fa-cart-arrow-down"></i><hr></h1>
                        </center>
                       
                        </thead>
                        <%
                            int alltotal=0;
                            
                            
                            try{
                            
                            Connection con=ConnectionProvider.getCon();
                            Statement st=con.createStatement();
                            ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+ email +"' ");
                            while(rs1.next()){
                            
                            
                            alltotal=rs1.getInt(1);
                            
                            }
                            
                            }catch(Exception e){
                            out.println(e);
                            }
                            
                            
                            
                        %>
                         
                        <thead  class="bg-dark text-white border-0">
                            <tr>
                                
                                <th scope="col" class=""><a  class="text-decoration-none text-white" href="myCart.jsp"><i class="fas fa-arrow-alt-circle-left"></i> Back</a></th>
                                <th scope="col" class="">Total Cost : <% out.print(alltotal);%> ks</th>
                                
                                
                            </tr>
                        </thead>
                        <thead  class="bg-dark text-white">
                            <tr>
                                <th scope="col">S.No</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price (ks)</th>
                                <th scope="col">Quantity</th>
                               <th scope="col">Sub Total (ks)</th>
                                
                           </tr>
                        </thead>
                        
                        <%  
                             int sno=0;
                             int total=0;
                             int start=0;
                             int recordCount=100;
                           int pgno=request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
                            start=pgno*recordCount;
                          
                            Connection con=ConnectionProvider.getCon();
                            
                           
                            String sql="select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'  ORDER BY id DESC  limit ?,? ";
                            PreparedStatement pst=con.prepareStatement(sql);
                            pst.setInt(1,start);
                            pst.setInt(2,recordCount);
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){
                          
                            
                        
                        %>
                           
                               
                               
                                
                                <tr> 
                                    <%sno=sno+1;%>
                                    <td><%out.print(sno);%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("category")%></td>
                                    <td><%=rs.getString("price")%> /ks</td> 
                                    <td><%=rs.getString("quantity")%></td> 
                                    <td><%=rs.getString("total")%> /ks</td> 
                                   
                                    
                                </tr>
                        
                           
                         <%} 

                           String sql1="select count(*) from cart where email='"+email+"'";
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
      
            
            <div class="form text-center">
                <%
               Connection con1=ConnectionProvider.getCon();
                Statement st=con1.createStatement();
                ResultSet rst=st.executeQuery("select * from sigup where email='"+ email +"'");
                while(rst.next()){
                
                 %>
                <form action="addressPaymentForOrderAction.jsp" method="POST">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="">
                                <label for="address"><h3>Address</h3></label>
                                <input type="text" class="form-control" value="<%=rst.getString("address")%>"  name="address" placeholder="Enter Your Address" required=""/>
                            </div>
                            <div class=" mt-3">
                                <label for="city"><h3>City</h3></label>
                                <input type="text" class="form-control" value="<%=rst.getString("city")%>" name="city" placeholder="Enter Your City" required=""/>
                            </div>
                        </div>
                         <div class="col-md-6">
                            <div class="">
                                <label for="state"><h3>State</h3></label>
                                <input type="text" class="form-control" value=" <%=rst.getString("state")%>" name="state" placeholder="Enter Your State" required=""/>
                            </div>
                             <div class="mt-3">
                                 <label for="country"><h3>Country</h3></label>
                                <input type="text" class="form-control" value="<%=rst.getString("country")%>" name="country" placeholder="Enter Your Country" required=""/>
                            </div>
                        </div>
                            <hr class="text-white mt-3" style="border: 2px dashed black;">
                    </div>       
                    <div class="row mt-5">
                      
                            <div class="col-md-6">
                                <label for="select"><h3>Select way of Payment</h3> </label>
                                <select class="form-control" name="payment" required="">
                                   
                                    <option value="Cash on delivery">Cash on delivery (COD)</option>
                                    <option value="Online Payment">Online Payment</option>
                                </select>
                            </div>
                            <div class="col-md-6 ">
                                <label for="transation"><h3>Pay online on this kyawlinn@pay.com <small>(digits<=6 )</small></h3></label>
                                <input type="text" class="form-control" name="transation" placeholder="Enter Transation TID" required=""/>
                            </div>
                            <hr class="text-white mt-3" style="border: 2px dashed black;">
                    </div>
                    <div class="row mt-5">
                        <div class="col-md-6 ">
                            <label for="mobile"><h3>Mobile <small> (No more digits: 1-12 )</small></h3> </label>
                             <input type="text" class="form-control" value="<%=rst.getString("mobile")%>" name="mobile" placeholder="Enter Mobile Number" required=""/>
                        </div>
                            
                       <div class="col-md-6 mt-3">
                            <div class="row mt-3">
                                <div class="col-sm-12 bg-dark mx-auto " style="border-radius: 40px;">
                                    <button type="submit" class="btn btn-outline-info m-2">Procced to Generate Bill &  Save <i class="far fa-arrow-alt-circle-right"></i></button>
                                    
                                </div>
                            </div>
                        </div>
                       <hr class="text-white mt-3" style="border: 2px dashed black;">
                    </div>                
                </form>
                 <% }%>
            </div>
               
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
