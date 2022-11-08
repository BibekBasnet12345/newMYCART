
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import ="com.helper.*"%>
<%@page import ="java.sql.*"%>
<%

String email=request.getParameter("email");
String mobile=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityquestion");
String securityAnswer=request.getParameter("answer");
String password =request.getParameter("newpassword");


	int check=0;
try{
	  Connection con=ConnectionProvider.getcon();
	  Statement st=con.createStatement();
	 String q=" select * from  users where  email='"+email+"'   and mobileNumber='"+mobile+"' and  securityQuestion='"+securityQuestion+"' and  answer ='"+securityAnswer+"'     ";
	  ResultSet rs=st.executeQuery(q);
	while(rs.next())
  {
	check=1;
	st.executeUpdate("update users set password='"+password+"' where  email='"+email+"'");
	response.sendRedirect("forgotPassword.jsp?msg=done");

       }
    if(check==0){
	out.println("yo chalo");
	response.sendRedirect("forgotPassword.jsp?msg=notdone");
}
}catch(Exception e){
	System.out.println(e);
}
%>