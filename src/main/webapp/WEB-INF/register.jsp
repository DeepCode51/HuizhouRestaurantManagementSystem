<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/logReg.css">
 <link href='https://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
<title>Register</title>
</head>
<body>
	<div class="page-header" style="background-image: url(/images/plate.jpg)">
	 <div id="container">
	      <div id="logo_bar">
	        <img id="logo" src="/images/utensile1.png" alt="logo"> <span>我的徽菜</span>
	      </div>
	      <div id="form_box">
	        <form:form method="POST" action="/registration" modelAttribute="user">
	          <p id="form_heading">Register</p>
	          
	          <form:input path="alias" type="text" placeholder="Username"/><br />
	          <form:errors path="alias" class="errors"/>
	          
	          <form:input path="username" class="input" type="email" placeholder="Email"/><br />
	          <form:errors path="username" class="errors"/>
	          
	          <form:password path="password" class="input" placeholder="Password"/><br />
	          <form:errors path="password" class="errors"/>
	          
	          <form:password path="passwordConfirmation" class="input"  placeholder="Confirm Password"/><br />
	          <form:errors path="passwordConfirmation" class="errors"/><br />
	          
	          <input type="submit" value="Register"><br />
	        </form:form>
	        
	        <a href="/" id="font_20">Already have an Account?</a><br /><br />
	      </div>
	   </div>
   </div>
</body>
</html>