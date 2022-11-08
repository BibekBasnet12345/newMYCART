<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=(PreparedStatement)con.prepareStatement("update users set address=?,city=?,state=?,county=? where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,email);
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
}catch(Exception e){
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
	e.printStackTrace();
}
%>