 <%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %> 
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

<%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet set=st.executeQuery("select * from product  where id='"+id+"'");
	while(set.next()) {
%>
<form action="editProductAction.jsp"  method="post">
<input type="hidden" name="id" value="<%=id %>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=set.getString(2) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=set.getString(3) %>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" value="<%=set.getString(4) %>" required> 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style"  name="active">
<option value="Yes">Yes<option>
<option value="No">No<option>
</select>
 <hr>
</div>
<button class="button">Save</button> <i class='far fa-arrow-alt-circle-right'></i>
</form>
<%
}
	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>


</body>
<br><br><br>
</body>
</html>