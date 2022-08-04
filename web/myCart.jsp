
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
                         <%
                        String msg=request.getParameter("msg");
                        
                        if("nopossible".equals(msg)){%>
                          <h1 class="text-warning text-center" >There is only one quantity! So click on Remove.</h1>
                        <%}if("inc".equals(msg)){
                        %>
                        <h1 class="text-success text-center">This product quantity increased Success!</h1>
                        <%}
                       if("dec".equals(msg)){
                        %>
                        <h1 class="text-success text-center">This product quantity decreased Success!</h1>
                        <%}
                        if("removed".equals(msg)){%>
                        <h1 class="text-success text-center">This Product removed from your Cart.</h1>
                        <%}%>
                        <thead  class="bg-dark text-white border-0">
                            <tr>
                                
                                <th scope="col" class="">Total Cost : <% out.print(alltotal);%> ks</th>
                                <th scope="col" class=""><a href="home.jsp" class="text-decoration-none text-white text-center"> Add Product <i class="fas fa-plus-circle"></i></a></th>
                                <th scope="col"><a href="addressPaymentForOrder.jsp" class="text-decoration-none text-white"> Proceed To Order <i class="fas fa-arrow-alt-circle-right"></a></th>
                                
                                
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
                                <th scope="col">Remove <i class="fas fa-trash "></i></th>
                                
                                
                            </tr>
                        </thead>
                        
                        <%  
                             int sno=0;
                             int total=0;
                             int start=0;
                             int recordCount=5;
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
                                    <td align="left"><%=rs.getString("name")%></td>
                                    <td align="left"><%=rs.getString("category")%></td>
                                    <td align="right"><%=rs.getString("price")%> /ks</td> 
                                    <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc" class="text-dark"><i class="fas fa-plus-circle"></i></a> <%=rs.getString("quantity")%> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec" class="text-dark"><i class="fas fa-minus-circle"></i></a></td> 
                                    <td align="right"><%=rs.getString("total")%> /ks</td> 
                                    <td><button class="btn btn-dark "><a class="text-decoration-none text-white " href="removeCartAction.jsp?id=<%=rs.getString("id")%>">Remove <i class="fas fa-trash"></i></a></button></td> 
                                    
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
                                        <tr>
                                           
                                          <%
                                           for(int i=0;i<=total/recordCount;i++){ %>
                                       
                                           <td> 
                                                 <a href="myCart.jsp?pgno=<%=i%>" class="btn btn-dark mb-3">Page<%=i+1%></a>
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
