<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%  
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getcon();
	 Statement st=(Statement)con.createStatement();
	 st.execute("delete from cart where email ='"+email+"' and product_id='"+id+"' and address is NULL");
	 response.sendRedirect("myCart.jsp?msg=removed");
}catch(Exception e){
	e.printStackTrace();
}
%>