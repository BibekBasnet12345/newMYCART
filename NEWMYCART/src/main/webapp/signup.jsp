<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/signup.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp"  method="post">
    <input type="text" name="name" placeholder="enter your name" required>
    <input type="email" name="email" placeholder="enter your email address" required>
    <input type="number" name="number" placeholder="enter your ph number" required>
   <select name="securityquestion" required>
      <option  selected="selected" disabled="disabled" value="">select one question</option>
   <option value="what was your first car?">what was your first car?</option>
   <option value="what is  the name of your first pet?">what is  the name of your first pet?</option>
   <option value="what is the name of a place you born?">what is the name of a place you born?</option>
   </select>
        <input type="text" name="answer" placeholder="answer" required>
        <input type="password" name="password" placeholder="password here" required>
        <input type="submit"  value="signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg"); 
if("valid".equals(msg)){
%>
<h2 style="color:red">Successfully Registered</h2>
<%} %><%if("invalid".equals(msg)) {%>

<h2 style="color:red">Some thing Went Wrong! Try Again!</h2>
<P style="color:red">May be the email is already registered</P>
<%} %>

    <h1 >Online Shopping</h1>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>