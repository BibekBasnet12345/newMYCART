<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try{
Connection con=ConnectionProvider.getcon();
Statement st=(Statement)con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
while(rs.next()){
%>
<h3>Name: <%=rs.getString(1) %></h3>
<hr>
 <h3>Email: <%=email %></h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(3) %></h3>
 <hr>
<h3>Security Question:<%=rs.getString(4) %> </h3>
<hr>
      <br>
      <br>
      <br>
<%}
}
catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>