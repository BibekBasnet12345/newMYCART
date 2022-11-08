<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%String email=session.getAttribute("email").toString();
String subject =request.getParameter("subject");
String body=request.getParameter("body");
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement pstmt=(PreparedStatement)con.prepareStatement("insert into message (email,subject,body) values(?,?,?)");
	pstmt.setString(1,email);
	pstmt.setString(2,subject);
	pstmt.setString(3,body);
	pstmt.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("messageUs.jsp?msg=invalid");
}

%>