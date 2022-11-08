<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>change address</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} 
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){	
%>
<form action="changeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input type="text"  name="address" value="<%=rs.getString(7)%>"  placeholder="enter address" required class="input-style">
 <hr>
 <h3>Enter city</h3>
 <input type="text"  name="city" value="<%=rs.getString(8)%>"  placeholder="enter city " required class="input-style">
<hr>
<h3>Enter State</h3>
 <input type="text"  name="state" value="<%=rs.getString(9)%>"  placeholder="enter state" required class="input-style">
<hr>
<h3>Enter country</h3>
 <input type="text"  name="country" value="<%=rs.getString(10)%>"  placeholder="enter country " required class="input-style">
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%	}
}catch(Exception e){
	e.printStackTrace(); 
}
%>
</body>
<br><br><br><br>
</html>