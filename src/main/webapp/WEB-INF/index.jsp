<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="backround-color=#ffebee">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="/css/style.css">
    
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>我的徽菜</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/paper-kit.css?v=2.1.0" rel="stylesheet"/>
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top bg-danger navbar-transparent" color-on-scroll="300">
	<div class="container">
		<div class="navbar-translate">
			<div class="navbar-header">
				<a class="navbar-brand" href="/home">我的徽菜</a>
			</div>
			<button class="navbar-toggler navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-bar"></span>
				<span class="navbar-toggler-bar"></span>
				<span class="navbar-toggler-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="/profile" data-scroll="true" href="javascript:void(0)">个人中心</a>
				</li>
				<li class="nav-item">
					<form id="logoutForm" method="POST" action="/logout">
        				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        				<button type="submit" class="btn btn-round btn-danger" >
						<i class="fas fa-sign-out-alt"></i> 退出登录
						</button>
    				</form>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="page-header" data-parallax="true" style="background-image: url('images/food9.jpg')">
		<div class="filter"></div>
		<div class="content-center">
			<div class="motto">
				<h1 class="title-uppercase text-center">我的徽菜</h1>
				<h3 class="text-center">搜索菜谱</h3>
				<form method="get" action="/home">
					<i class="fa fa-search" style="font-size:20px;" aria-hidden="true"></i> <input type="text" name="q">
				<br/>
				<br/>
					<button type="submit" class="btn btn-warning btn-round btn-lg">
						<i aria-hidden="true"></i> 提交
					</button>
				</form>
			</div>
		</div>
	</div>
  	 <div class="wrapper">
        <div class="main">
            <div class="section section-white">
            	<div class="container">
	  <div class="row">
	    <div class="col-sm">
	      	<h5 id="other">其他菜谱排名</h5>
				<div id="inner_box">
				<c:forEach items="${allRecipes}" var="recipe">
			    	<div class="tag"><span class="tag-label"><a href="/show/recipe/${recipe.id}">${recipe.title}</a></span> <span class="count"><span class="count-value">${recipe.avgRating}</span></span></div>
		  		</c:forEach>
		  		</div>
	    </div>
	    <div class="col-md">
	        <div class="article_box">
			<c:forEach items="${searchRecipes}" var="recipe">
				<article class="media">
				  <figure class="media-left">
				    <p class="image is-75x75">
				      <c:if test="${!recipe.img.isEmpty()}">
				      <img src="data:image/png;base64,${recipe.img}">
				    </c:if>
				    <c:if test="${recipe.img.isEmpty()}">
				      <img src="/images/mind.jpeg">
				    </c:if>
				    </p>
				  </figure>
				  <div class="media-content">
				    <div class="content">
				      <p>
				        <a href="/show/recipe/${recipe.id}"><strong>${recipe.title}</strong></a> <small>By: ${recipe.uploader.alias}</small>
				        <br>
				        <strong >详情:</strong>${recipe.description}
				        <br>
				        <span class="icon is-small is-left">
	      					<i class="far fa-clock"></i>
	    				</span>
	    				<strong>准备时间:</strong><small> ${recipe.prep}</small>
	    				<br>
				        <strong>排名: </strong> <span class="stars">${recipe.avgRating}</span>
				      </p>
				    </div>
				  </div>
				</article>
			</c:forEach>
		</div>
	</div>
	<c:if test="${searchRecipes == null}">
	<div class="allRecipes">
	    <div class="col-md">
	    <h1 id="top_5">热门菜谱</h1>
	       <div class="article_box">
			<c:forEach items="${topRecipes}" var="recipe">
				<article class="media">
				  <figure class="media-left">
				    <p class="image is-75x75">
				    <c:if test="${!recipe.img.isEmpty()}">
				      <img src="data:image/png;base64,${recipe.img}">
				    </c:if>
				    <c:if test="${recipe.img.isEmpty()}">
				      <img src="/images/mind.jpeg">
				    </c:if>
				    </p>
				  </figure>
				  <div class="media-content">
				    <div class="content">
				      <p>
				        <a href="/show/recipe/${recipe.id}"><strong>${recipe.title}</strong></a> <small>By: ${recipe.uploader.alias}</small>
				        <br>
				        <strong>详情:</strong>${recipe.description}
				        <br>
				        <span class="icon is-small is-left">
	      					<i class="far fa-clock"></i>
	    				</span>
	    				<strong>食材准备时间:</strong><small> ${recipe.prep}</small>
	    				<br>
				        <strong>点评: </strong> <span class="stars">${recipe.avgRating}</span>
				      </p>
				    </div>
				  </div>
				</article>
			</c:forEach>
		</div>
		
	    </div>
	    </div>
	    </c:if>
	    <div class="add-box">
		    <div class="col" id="fork_box">
		      <img id="fork" src="images/mind2.png">
			  	<div id="add_button">
				<a href="/add/recipe" class="button is-primary is-rounded">添加一个新食谱</a>
		    	</div>
		 
	                            
	  		</div>
	  	</div>
	</div>
	</div>	
     </div>
     	</div>
     </div> 
     <footer class="footer footer-gray">
		<div class="container">
    		<div class="row">
    			<div class="credits ml-auto">
    				<span class="copyright">
    					© <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by Zoya Ali
    				</span>
    			</div>
    		</div>
    	</div>
	</footer>		      
		
	
</body>
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/popper.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/paper-kit.js?v=2.1.0"></script>
<script  type="text/javascript" src="/js/source.js"></script>
<script type="text/javascript" src="/js/stars.js"></script>
</html>