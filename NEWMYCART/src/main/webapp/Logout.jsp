<%
session.invalidate();
response.sendRedirect("login.jsp?msg1=logout");
%>
