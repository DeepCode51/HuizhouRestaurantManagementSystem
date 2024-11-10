<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>View Profile</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="../assets/css/paper-kit.css?v=2.1.0" rel="stylesheet"/>
	<link href="../assets/css/demo.css" rel="stylesheet" />

	<!--     Fonts and icons     -->
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<link href="../assets/css/nucleo-icons.css" rel="stylesheet">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
	<body class="profile">
    <nav class="navbar navbar-expand-lg fixed-top navbar-transparent bg-danger nav-down" color-on-scroll="200">
		<div class="container">
			<div class="navbar-translate">
				<button class="navbar-toggler navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-bar"></span>
					<span class="navbar-toggler-bar"></span>
					<span class="navbar-toggler-bar"></span>
				</button>
				<div class="navbar-header">
					<a class="navbar-brand" href="/home">我的徽菜</a>
				</div>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="/home" data-scroll="true" href="javascript:void(0)">主页</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/add/recipe" data-scroll="true" href="javascript:void(0)">上传菜谱</a>
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
    <div class="wrapper">
        <div class="page-header page-header-small" style="background-image: url('../images/back6.jpg');">
            <div class="filter"></div>
        </div>
        <div class="profile-content section">
            <div class="container">
                <div class="row">
                    <div class="profile-picture">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new img-no-padding">
                            	<c:if test="${currentUser.img == null}">
                            		<img src="/images/default-user.png">
                            	</c:if>
                            	<c:if test="${currentUser.img != null}">
                                	<img src="data:image/png;base64,${currentUser.img}">
                                </c:if>
                            </div>
       
                            <!--button class="btn btn-outline-default btn-round" class="fileinput-new" id="upload-btn"><i class="fa fa-cog"></i>Upload Image</button>-->
                            <div class="name">
                                <h4 class="title text-center">${currentUser.alias}<br /><small>${currentUser.username}</small></h4>
                            </div>
	                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 ml-auto mr-auto text-center">
                        <p>${currentUser.description}</p>
                        <br />
                        
                    </div>
                </div>
                <br/>
               
                <div class="tab-content">
                    <div class="bottom_box">    
	                    <div class="row coloured-cards">
	                    <div class="col-md-auto col-sm-6">
	                        <div class="card-big-shadow">
	                            <div class="card card-just-text" data-background="color" data-color="blue" data-radius="none">
	                                <div class="card-body">
	                                    <h4 class="card-title">收藏 <i class="fa fa-heart heart"></i></h4>
	                                    <ul class="my_list">
	                                    	<c:forEach items="${currentUser.favRecipes}" var="recipe">
	                                    	<li class="under_list">
	                                    		<a class="card-description" href="/show/recipe/${recipe.id}">${recipe.title}</a>
	                                    	</li>
	                                    	</c:forEach>
	                                    </ul>
	                                    
	                                </div>
	                            </div> <!-- end card -->
	                        </div>
	                    </div>
	
	                    <div class="col-md-auto col-sm-6">
	                        <div class="card-big-shadow">
	                            <div class="card card-just-text" data-background="color" data-color="green" data-radius="none">
	                                <div class="card-body">
	                                   
	                                    <h4 class="card-title">我的上传</h4>
	                                    <ul class="my_list">
	                                    	<c:forEach items="${currentUser.recipes}" var="recipes">
	                                    	<li>
	                                    		<a class="card-description" href="/show/recipe/${recipes.id}">${recipes.title}</a><br> 
	                                    		<a href="/edit/${recipes.id}" id="edit_link">编辑</a> | <a href="/delete/${recipes.id}" id="delete_link">删除</a>
	                                    	</li>
	                                    	</c:forEach>
	                                    </ul>
	                                </div>
	                            </div> <!-- end card -->
	                        </div>
	                    </div>                 
	                </div>
                </div>
             </div>
            </div>
                    </div>
                    <div class="tab-pane text-center" id="following" role="tabpanel">
                        
                        <a class="btn btn-warning btn-round" id="edit-btn" href="/edit/profile/${currentUser.id}">编辑设置</a>
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

<script src="../assets/js/jasny-bootstrap.min.js"></script>
<script src="../assets/js/paper-kit.js?v=2.1.0"></script>
</html>