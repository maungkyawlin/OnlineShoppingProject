
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Page</title>
    </head>
    <body class="">
        <%@include file="header.jsp" %>
        
       <div class="container mt-3 mb-3">
         <center>
          <h1>My Cart <i class="fas fa-cart-arrow-down"></i><hr></h1>
        </center>
            <div class="row bg-dark text-white">
                <h1 class="text-center">Online Shopping Bill (EASY Shop)<hr></h1>
        <%
            
            try{
            int total=0;
            int sno= 0;
            
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            
            
            ResultSet rs2=st.executeQuery("select * from sigup inner join cart where cart.email='"+email+"' and status='bill' ");
            while(rs2.next()){%>
                <div class="col-md-4">
                    <p>Name: <%=rs2.getString("name")%></p> 
                    <p>Email: <%out.println(email);%></p>
                    <p>Mobile: <%=rs2.getString("mobile")%></p>
                    <p>Address: <%=rs2.getString("address")%></p>
                </div>
                <div class="col-md-4">
                    <p>City: <%=rs2.getString("city")%></p> 
                    <p>State: <%=rs2.getString("state")%></p>
                    <p>Country: <%=rs2.getString("country")%></p>
                  
                </div>
                <div class="col-md-4">
                    <p>Order Date: <%=rs2.getString("orderDate")%></p> 
                    <p>Expected Delivery: <%=rs2.getString("deliDate")%></p>
                    <p>Payment Method: <%=rs2.getString("payment")%></p>
                    <p>Transaction ID: <%=rs2.getString("transation")%></p>
                </div>
            
           <%break;}
            }catch(Exception e){
            out.print(e);
            }
        %>
        
               
            </div>
        <hr class="text-white mt-3" style="border: 2px dashed black;">
        </div>
        <div class="container ">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead>
                        <center><h3>Product Details  <hr></h3></center>
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
                                
                                <th scope="col" class=""><a  class="text-decoration-none text-white" href="addressPaymentForOrder.jsp"><i class="fas fa-arrow-alt-circle-left"></i> Back</a></th>
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
                            ResultSet rs1=pst.executeQuery();
                             
                           while(rs1.next()){
                          
                            
                        
                        %>
                           
                               
                               
                                
                                <tr> 
                                    <%sno=sno+1;%>
                                    <td align=""><%out.print(sno);%></td>
                                    <td align="left"><%=rs1.getString("name")%></td>
                                    <td align="left"><%=rs1.getString("category")%></td>
                                    <td align="right"><%=rs1.getString("price")%> /ks</td> 
                                    <td align=""><%=rs1.getString("quantity")%></td> 
                                    <td align="right"><%=rs1.getString("total")%> /ks</td> 
                                   
                                    
                                </tr>
                        
                           
                         <%} 

                           String sql1="select count(*) from cart where email='"+email+"'";
                           PreparedStatement pst1=con.prepareStatement(sql1);
                           ResultSet rs3=pst1.executeQuery();
                            
                                 if(rs3.next()){
                                    total=rs3.getInt(1);
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
            </div>
        <hr class="text-white mt-3" style="border: 2px dashed black;">
        </div>
        <div class="container text-center p-3">
            <div class="row">
                <div class="col-md-6 mt-3">
                            <div class="row mt-3">
                                <div class="col-sm-10 bg-dark mx-auto " style="border-radius: 40px;">
                                    <a href="continueShopping.jsp">  
                                        <button  class="btn btn-outline-info m-2">Continue Shopping <i class="far fa-arrow-alt-circle-right"></i></button>
                                    </a>
                                </div>
                            </div>
                </div>
                 <div class="col-md-6 mt-3">
                            <div class="row mt-3">
                                <div class="col-sm-10 bg-dark mx-auto " style="border-radius: 40px;">
                                    <a onclick="window.print();">
                                        <button  class="btn btn-outline-info m-2"> Print <i class="far fa-arrow-alt-circle-right"></i></button>
                                    </a> 
                                </div>
                            </div>
               </div>
            </div>                                     
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
