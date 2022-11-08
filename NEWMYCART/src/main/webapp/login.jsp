<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/signup.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" action="post">
     <input type="email" name="email" placeholder="enter email" required="required">
     <input type="password" name="password" placeholder="enter password" required="required">
     <input type="submit"  value="login">
     </form>
      <h2><a href="signup.jsp ">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg=request.getParameter("msg");
 String msg1=request.getParameter("msg1");
 if("logout".equals(msg1)){
	 %>
	  <h2 style="color:red">Logout successfully</h2>
	 <%
 }
  if("notexist".equals(msg)){
  %>  <h2 style="color:red">Incorrect Username or Password</h2><% }
  if("invalid".equals(msg)){
  %>
<h2 style="color:red">Some thing Went Wrong! Try Again !
<p>Register your account first</p>
</h2><%} %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>