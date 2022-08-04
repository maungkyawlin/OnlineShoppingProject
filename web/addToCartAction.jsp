
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;
try{

Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from product where id='"+ product_id +"'");
while(rs.next()){
  product_price=rs.getInt("price");
  product_total=product_price;

    }
    ResultSet rs1=st.executeQuery("select * from cart where product_id='"+ product_id +"' and email='"+ email +"' ");
    while(rs1.next()){
    
    cart_total=rs1.getInt("total");
    cart_total=cart_total + product_total;
    quantity=rs1.getInt("quantity");
    quantity=quantity+1;
    z=1;
    
    }
if(z==1){

st.executeUpdate("update cart set total="+cart_total +", quantity='"+ quantity +"' where product_id='"+ product_id +"' and email='"+ email +"' ");
response.sendRedirect("home.jsp?msg=exist");
    }
  if(z==0){
   PreparedStatement pst=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
   pst.setString(1, email);
   pst.setString(2, product_id);
   pst.setInt(3, quantity);
   pst.setInt(4, product_price);
   pst.setInt(5, product_total);
   pst.executeUpdate();
   response.sendRedirect("home.jsp?msg=added");
    }  

    }catch(Exception e){
    
    out.println(e);
    response.sendRedirect("home.jsp?msg=invaild");
    }
    

%>