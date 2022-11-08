
<%@page import="com.entity.user"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import ="com.helper.*"%>
<%@page import ="java.sql.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("number");
String securityQuestion=request.getParameter("securityquestion");
String securityAnswer=request.getParameter("answer");
String password =request.getParameter("password");
String address="";
String city="";
String state="";
String country ="";
try{
	 Connection con=ConnectionProvider.getcon();
	 PreparedStatement pstmt=(PreparedStatement) con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	   pstmt.setString(1,name);
		pstmt.setString(2,email);
		pstmt.setString(3,mobile);
		pstmt.setString(4,securityQuestion);
		pstmt.setString(5,securityAnswer);
		pstmt.setString(6,password);
		pstmt.setString(7,address);
		pstmt.setString(8,city);
		pstmt.setString(9,state);
		pstmt.setString(10,country);
       pstmt.executeUpdate();
   	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e){
	 System.out.println(e);
	 response.sendRedirect("signup.jsp?msg=invalid");
}

%>