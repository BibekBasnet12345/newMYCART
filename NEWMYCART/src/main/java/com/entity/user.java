package com.entity;
public class user {
private  String name;
private  String email;
private String  mobilenumber;
private  String securityQuestion;
private  String answer;
private  String password;
private  String address;
private  String city;
private  String state;
private  String country;

public user(String name, String email, String mobilenumber, String securityQuestion, String answer, String password,
		String address, String city, String state, String country) {
	super();
	this.name = name;
	this.email = email;
	this.mobilenumber = mobilenumber;
	this.securityQuestion = securityQuestion;
	this.answer = answer;
	this.password = password;
	this.address = address;
	this.city = city;
	this.state = state;
	this.country = country;
}
public user() {
	super();
	// TODO Auto-generated constructor stub
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobilenumber() {
	return mobilenumber;
}
public void setMobilenumber(String mobilenumber) {
	this.mobilenumber = mobilenumber;
}
public String getSecurityQuestion() {
	return securityQuestion;
}
public void setSecurityQuestion(String securityQuestion) {
	this.securityQuestion = securityQuestion;
}
public String getAnswer() {
	return answer;
}
public void setAnswer(String answer) {
	this.answer = answer;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}



}
