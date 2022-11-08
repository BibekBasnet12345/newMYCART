<%
String emaill=session.getAttribute("email").toString();
boolean bb="admin@gmail.com".equals(emaill);
if(bb==false){
	response.sendRedirect("login.jsp?message=notdone");
	return;
}
else if(emaill.isEmpty()){
	response.sendRedirect("login.jsp?message=notdone");
	return;
}
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Product Added Successfully!</h3>
<%}else if("notdone".equals(msg)){%>
<h3 class="alert">Some thing went wrong! Try Again!</h3><%} %>
<%int id=1;
try{
	 Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet re=st.executeQuery("select max(id ) from product");
	while(re.next()){
		id=re.getInt(1);
		id=id+1;
	}
}catch(Exception e){
	
}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID:<%=id %> </h3>
<input type="hidden" name="id" value="<%=id %>"> 

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="enter name " required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
  <input class="input-style" type="text" name="category" placeholder="enter category " required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" placeholder="enter  price " required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">Yes</option>
<option value="No">No</option>

</select>
   
<hr>
</div><button class="button">Save
 <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>