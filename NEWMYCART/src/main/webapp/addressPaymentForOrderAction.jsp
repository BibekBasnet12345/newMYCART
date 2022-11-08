<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobile=request.getParameter("mobile");
String paymentmethod=request.getParameter("paymentmethod");
String transactionid=request.getParameter("transactionid");
String status="bill";
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=(PreparedStatement)con.prepareStatement("update users set address=?,city=?,state=?,county=?,mobileNumber=? where email=?");
	ps.setString(1, address);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, country);
	ps.setString(5, mobile);
	ps.setString(6, email);
	ps.executeUpdate();
	
	PreparedStatement ps1=(PreparedStatement)con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and  address is NULL");
	ps1.setString(1, address);
	ps1.setString(2, city);
	ps1.setString(3, state);
	ps1.setString(4, country);
	ps1.setString(5, mobile);
	ps1.setString(6,paymentmethod);
	ps1.setString(7,transactionid);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	e.printStackTrace();
}

%>