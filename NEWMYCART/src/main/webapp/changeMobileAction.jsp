<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%
String email=session.getAttribute("email").toString();
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'  and password='"+password+"' ");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set mobileNumber='"+mobile+"' where email='"+email+"' ");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}catch(Exception e){
	e.printStackTrace();
}

%>