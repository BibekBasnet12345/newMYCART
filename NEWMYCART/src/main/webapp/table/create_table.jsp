<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import ="com.helper.*"%>
<%@page import ="java.sql.*"%>
<% 
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	//String q="create table users(name varchar(100),email varchar(100) primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),county varchar(100))";
	//String q="create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10)) ";
	//String q="create  table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(500), city varchar(100),state varchar(100),country varchar(200),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod  varchar(100),transactionId varchar(100),status varchar(10))";
	String q="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(100),PRIMARY KEY(id))";
	System.out.println(q);
	st.execute(q);
	System.out.println("table created");
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
