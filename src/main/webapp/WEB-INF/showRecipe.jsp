<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/showRecipe.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Satisfy'>
<link rel="stylesheet" href="http://ni112517_1.vweb03.nitrado.net/ext-images/icon/font.css"><meta name="viewport" content="width=device-width, user-scalable=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link href="https://fonts.googleapis.com/css?family=Audiowide%7CRoboto+Condensed" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<title>Show Recipe</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-light" style="background-color:#f7765f;">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">我的徽菜</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	 	</button>
		<div class="collapse navbar-collapse" id="navbarText">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="/home">主页<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="/profile">个人中心</a>
		      </li>
		      <li class="nav-item">
					<form id="logoutForm" method="POST" action="/logout">
	        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        			<button type="submit" class="logout">
						<i class="fas fa-sign-out-alt"></i> 退出登录
						</button>
    				</form>
				</li>
		    </ul>
    	</div>  
	</nav>
	<article class="recipe">
	  <header>
	    <h1 class="title">${Recipe.title}</h1>
	    <div id="campfire">
	      <div id="logs">
	        <div></div>
	        <div></div>
	      </div>
	      <div id="flames">
	        <div></div>
	        <div></div>
	        <div></div>
	      </div>
	    </div>
	  </header>
    
  <div class="recipe-text">
    <div class="intro clearfix">
      <h2>准备开做。。。</h2>
      
	      <c:if test="${Recipe.img.isEmpty()}">
	      	 <img class="preview-img" src="/images/hot.jpg" style="max-width: 370px; max-height: 250px;">
	      </c:if>
	      <c:if test="${!Recipe.img.isEmpty()}">
	      <img class="preview-img" src="data:image/png;base64,${Recipe.getImg()}" style="max-width: 370px; max-height: 250px;">
	      </c:if>
     
      <p class="para">${Recipe.description}</p>
     	<div class="prep">
	     	<span class="icon is-small is-left">
	      		<i class="far fa-clock"></i>
	    	</span>
	    	<strong>准备时间需要:</strong><small>${Recipe.prep}</small>
    	</div>		
    </div>
    
    
    <div class="ingredients clearfix">
    <h2>你需要</h2>
    <ul>
    <c:forEach items="${Recipe.ingredients}" var="ing" varStatus="loop">
      <li>
        <input type="checkbox" class="recipe-check" id="${ing.ingredient}"> <label for="${ing.ingredient}"><span></span>${ing.ingredient}</label>
      </li>
    </c:forEach>
    </ul>
      
    <div class="calculate">
      <p>
        快收藏这个食谱吧！
      </p>
	  	<form action="/addToFav" method="get">
			<input type="hidden" name="user_id" value="${currentUser.id}">
			<input type="hidden" name="recipe_id" value="${Recipe.id}">
			<input class="ready" type="submit" value="收藏">
		</form>
		<p class="errors">${faverror}</p>
    </div>
    </div> <!-- ingredients -->
  </div><!-- recipe-text -->
    
  <div class="recipe-directions clearfix" id="ready">
    <h2>详情</h2>
    <ul>
     <li class="food">
        <span class="icon-food"></span>${Recipe.formula} .
      </li>
      </ul>
      <ul id="messages">
      <c:forEach items="${Recipe.reviews}" var="r">
      	<li>
			<div class="infos">
			<c:if test="${r.user.img != null}">
			 <img src="data:image/png;base64,${r.user.img}">
			</c:if>
			<c:if test="${r.user.img == null}">
				<img src="/images/default-user.png"/>
			</c:if>
			</div>
			<div class="content">
				<h3>
					${r.user.alias}
				</h3>	
				<p>	Rating: <span class="stars">${r.rating}</span></p>
				<p>
					Review: ${r.text}
				</p>
			</div>
		</li>
	</c:forEach>
    </ul>
  </div>
  </article>
  	<div id="review_form" style="background-image: url('/images/cake.jpeg')">
  	<form:form method="POST" action="/review/${Recipe.id}" modelAttribute="my_review" class="contact">
  		<fieldset class="contact-inner">
  			<p class="contact-input">
				<form:label path="text">
					<form:textarea path="text" class="textarea" placeholder="留下你的评论吧！"/>
					<form:errors path="text"/>
				</form:label>
			</p>
			<p class="contact-input">
				<label for="select" class="select">	
					<form:select path="rating" class="form-control">
						<c:forEach items="${stars}" var="star" varStatus="loop">
							<form:option  value="${5-loop.index}">${star}</form:option>
						</c:forEach>	
					</form:select>	
					<form:errors path="rating"/>
				</label>
			</p>
			 <p class="contact-submit">
				<input type="hidden" name="recipe" value="${Recipe.id}"/>
				<input type="hidden" name="user" value="${currentUser.id}"/>		       
				<input type="submit" value="提交"/>
			</p>
			<p class="errors">${errors}</p>
		</fieldset>
		</form:form>
	
	</div>
	<footer>
	  <p>
	    This Recipe is contributed By <span>♥</span>
	  </p>
	  <h3>
	    ${Recipe.uploader.alias}
	  </h3>
	</footer>

	<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="../assets/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
	<script src="../assets/js/popper.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script  src="/js/script.js"></script>
    <script  src="/js/retro.js"></script>
	<script type="text/javascript" src="/js/stars.js"></script>
	<script src="../assets/js/paper-kit.js?v=2.1.0"></script>
	
	
	
</body>
</html>