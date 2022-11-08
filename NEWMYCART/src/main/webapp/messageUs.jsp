<%@include file="footer.jsp" %> 
<%@include file="header.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String message =request.getParameter("msg");
if("valid".equals(message)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%}
if("invalid".equals(message)){%>
<h3 style="text-align:center; color:red; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input type="text" class="input-style"  name="subject" placeholder="subject" required="required">
<hr>
<textarea class="input-style" name="body" placeholder="enter your message" required="required"></textarea>
<hr>
<button class="button" type="submit">Send<i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
</body>
</html>