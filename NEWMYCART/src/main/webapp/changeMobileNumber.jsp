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
<title>Message Us</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%}
if("wrong".equals(msg)){ %>
<h3 class="alert">Your Password is wrong!</h3>

<%} %>
<form action="changeMobileAction.jsp"  method="post">
<%try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next()){
	%>
 <h3>Enter Your New Mobile Number</h3>
 <input   class="input-style" type="number"  name="mobile" value="<%=rs.getString(3)%>" required="required">
 <hr>
<h3>Enter Password (For Security)</h3>
 <input   class="input-style" type="password"   name="password"  required="required">
<hr>
 <button  class="button" type="submit" >Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%}
}catch(Exception e){
e.printStackTrace();
} %>
</body>
<br><br><br>
</html>