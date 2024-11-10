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
 	<title>Login</title>
</head>
<body>

	<div class="page-header" style="background-image: url(/images/plate.jpg)">
		<div id="container">
	      <div id="logo_bar">
	        <img id="logo" src="/images/utensile1.png" alt="logo"> <span>我的徽菜</span>
	      </div>
	      <div id="form_box">
	        <form action="/login" method="POST">
	          <p id="form_heading">Login</p>
	          <input class="input" name="username" placeholder="Email"><br />
	          <input class="input" type="password" name="password" placeholder="Password"><br />
	          <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	          	<c:if test="${errorMessage != null}">
	        		<p class="errors">${errorMessage}</p>
	    		</c:if>
	          <input type="submit" value="Login"><br />
	        </form>
	        <a href="/registration" id="font_20">Don't have an Account?</a><br /><br />
	      </div>
	    </div>
    </div>
</body>

</html>