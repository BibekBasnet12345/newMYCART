<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%String  id=request.getParameter("id");
String  name=request.getParameter("name");
String   category=request.getParameter("category");
String  price=request.getParameter("price");
String  active=request.getParameter("active");

System.out.println(active);
try{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=(Statement)con.createStatement();
	String q="update product set name='"+name+"' ,category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'";
	stmt.executeUpdate(q);
	if("No".equals(active)){
		stmt.executeUpdate("delete from cart  where product_id='"+id+"' and address is NULL");
	}
	 response.sendRedirect("allProductEditProduct.jsp?msg=done");
}catch(Exception e){
	 response.sendRedirect("allProductEditProduct.jsp?msg=notdone");
	e.printStackTrace();
}













%>