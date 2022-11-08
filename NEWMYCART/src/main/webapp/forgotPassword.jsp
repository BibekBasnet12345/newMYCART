<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotpasswordAction.jsp" method="post">
     <input  type="email" name="email" placeholder="enter email " >
     <input  type="number" name="mobilenumber" placeholder="enter mobile number " >
     <select name="securityquestion" >
      <option  selected="selected" disabled="disabled" value="">select one question</option>
   <option value="what was your first car?">what was your first car?</option>
   <option value="what is  the name of your first pet?">what is  the name of your first pet?</option>
   <option value="what is the name of a place you born?">what is the name of a place you born?</option>
   </select>
       <input  type="text" name="answer" placeholder="answer please " >
     <input  type="password" name="newpassword" placeholder="enter new password to set  " >
     <input  type="submit"  value="save">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%String msg=request.getParameter("msg");
   if("done".equals(msg)){
   %>
<h1>Password Changed Successfully!</h1><%}
   else if("notdone".equals(msg)){
   %>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>