

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
        <% 
          if(email.equals("kyawlinn1287@gmail.com")){%>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-12">
                    <table id="tbl-student " class="table table-responsive table-bordered mt-3 text-center"  cellpadding="0" width="100%">
                        <thead class="bg-dark text-white">
                        <center>
                            <h1>All Products & Edit Products  <i class="fab fa-elementor"></i><hr></h1>
                        </center>
                        </thead>
                        <thead  class="bg-dark text-white">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Category</th>
                                <th scope="col">Price (ks)</th>
                                <th scope="col"><i class="fa fa-inr"></i>Status</th>
                                <th scope="col">Edit <i class="fas fa-edit"></i></th>
                                <th >Delete <i class="fas fa-trash"></i></th>
                                
                            </tr>
                        </thead>
                        <%
                        String msg=request.getParameter("msg");
                        if("delete".equals(msg)){%>
                        <script>
                            alert("Your Data Delete Successfully");
                        </script>
                        <%}if("non".equals(msg)){
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
                        <% 
                            int sno=0;
                             int total=0;
                             int start=0;
                             int recordCount=5;
                           int pgno=request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
                            start=pgno*recordCount;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/osp","root","");
                            String sql="select * from product where id ORDER BY id DESC  limit ?,? ";
                            PreparedStatement pst=con.prepareStatement(sql);
                            pst.setInt(1,start);
                            pst.setInt(2,recordCount);
                            ResultSet rs=pst.executeQuery();
                             
                           while(rs.next()){%>
                               
                               
                                
                                <tr> 
                                  
                                    <%sno=sno+1;%>
                                    <td><%out.print(sno);%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("category")%></td>
                                    <td><%=rs.getString("price")%> /ks</td> 
                                    <td><%=rs.getString("active")%></td>
                              
                                   
                                    <td><button class="btn btn-dark  "><a class="text-decoration-none  text-white" href="updateProduct.jsp?id=<%=rs.getInt("id")%>">Edit <i class="fas fa-edit"></i></a></button></td>
                                    <td><button class="btn btn-dark "><a class="text-decoration-none text-white" href="deleteProduct.jsp?id=<%=rs.getInt("id")%>">Delete <i class="fas fa-trash"></i></a></button></td>
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
                                                 <a href="allProductEdit.jsp?pgno=<%=i%>" class="btn btn-dark mb-3">Page<%=i+1%></a>
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
            </div>
        </div>
        
        
        <%}else{%>
        <%@include file="adminError.jsp" %>
        <%}%>
        <%@include file="../footer.jsp" %>
    </body>
</html>
