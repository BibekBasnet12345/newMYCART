<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");
if(!confirmpassword.equals(newpassword)){
	response.sendRedirect("changePassword.jsp?msg=notMatch");
	 
}else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getcon();
		Statement st=(Statement)con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"'  and password='"+oldpassword+"'");
		while(rs.next()){
			check=1;
			st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"' ");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
}


%>