<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="delivered";
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>
 