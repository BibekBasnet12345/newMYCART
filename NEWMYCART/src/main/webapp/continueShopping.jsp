<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %> 
<%String emaill=session.getAttribute("email").toString();
String status="processing";
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement pstmt=(PreparedStatement)con.prepareStatement("update cart set status=? where email='"+emaill+"' and status='bill'");
	pstmt.setString(1,status);
	pstmt.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception e)
{
	e.printStackTrace();
}



%>