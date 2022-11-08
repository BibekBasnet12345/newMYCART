<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String  securityQuestion=request.getParameter("securityQuestion");
String  newAnswer=request.getParameter("newAnswer");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=(Statement)con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users  set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"' where  email='"+email+"' ");

		response.sendRedirect("changeSecurityQuestion.jsp?msg=done"); 
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}	
}catch(Exception e){
	e.printStackTrace();
}
%>