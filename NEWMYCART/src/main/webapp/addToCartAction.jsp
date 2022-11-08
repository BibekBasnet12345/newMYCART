<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String pId=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where  id= '"+pId+" ' ");
	while(rs.next()){
		  product_price=rs.getInt(4);
		  product_total=product_price;
	}
	ResultSet rs1=st.executeQuery("select * from cart where  product_id= '"+pId+" ' and email='"+email+"' and address  is NULL ");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
        quantity=rs1.getInt(3);
        quantity=quantity+1;
        z=1;
	}
	if(z==1){
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+pId+"' and email='"+email+"' and address  is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement pstmt=(PreparedStatement)con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		pstmt.setString(1,email);
		pstmt.setString(2,pId);
		pstmt.setInt(3,quantity);
		pstmt.setInt(4,product_price);
		pstmt.setInt(5,product_total);
		pstmt.execute();
		response.sendRedirect("home.jsp?msg=added");
	}
}catch(Exception e){
	response.sendRedirect("home.jsp?msg=invalid");
	e.printStackTrace();
}
%>