<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>编辑食谱</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
     <link href="../assets/css/paper-kit.css?v=2.1.0" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
</head>
<body class="add-product">
	<nav class="navbar navbar-expand-lg fixed-top bg-danger">
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
						<a class="nav-link" href="/home" data-scroll="true" href="javascript:void(0)">主页</a>
					</li>
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
	<div class="wrapper">
	    <div class="main">
	        <div class="section">
	            <div class="container">
	                <h2 id="recipe_heading">编辑食谱</h2>
	                <form:form method="POST" action="/update/${my_recipe.id}" modelAttribute="my_recipe" enctype="multipart/form-data" >
	                    <div class="row">
	                        <div class="col-md-5 col-sm-5">
	                            <h6>食谱图片</h6>
	                            <div class="fileinput fileinput-new text-center" data-provides="fileinput">
	                              <div class="fileinput-new thumbnail img-no-padding" style="max-width: 370px; max-height: 250px;">
	                                <c:if test="${my_recipe.img.isEmpty()}">
	                                	<img src="../assets/img/image_placeholder.jpg">
	                                </c:if>
	                              	<c:if test="${!my_recipe.img.isEmpty()}">
	                                	<img src="data:image/png;base64,${my_recipe.img}">
	                                </c:if>
	                              </div>
	                              <div class="fileinput-preview fileinput-exists thumbnail img-no-padding" style="max-width: 370px; max-height: 250px;"></div>
	                              <div>
	                                <span class="btn btn-outline-default btn-round btn-file"><span class="fileinput-new">上传图片</span><span class="fileinput-exists">更换</span><input type="file" name="file"></span>
	                                <a href="#paper-kit" class="btn btn-link btn-danger fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> 移除</a>
	                              </div>
	                            </div>
	                            <div id="gif" >
	                            	<img src="/images/bowl2.gif">
	                            </div>
	                        </div>
	                        
	                        <div class="col-md-7 col-sm-7">
	                            <div class="form-group">
	                                <h6>食谱名称 <span class="icon-danger">*</span></h6>
	                                <form:label path="title">
								    	<form:input path="title" class="form-control border-input" placeholder="写下你的食谱名称吧！"/>
								    	<form:errors path="title"/>
							    	</form:label>
	                            </div>
	                            <div class="form-group">
	                            <h6>食谱详情<span class="icon-danger">*</span></h6>
	                            <form:label path="description" >
								    <form:textarea path="description" class="form-control border-input" rows="6" cols="40" placeholder="简单介绍下你的食谱吧！"/>
								    <form:errors path="description"/>
							    </form:label>
							   </div>
	                            <div class="form-group">
	                                <h6>简略步骤<span class="icon-danger">*</span></h6>
	                                <small>每个步骤需要用,分割</small>
	                               
	                                <input type="text" name="ing" class="form-control border-input" value="${ings}">
	               
	                      
	                            </div>
	                            <div class="row price-row">
	                                <div class="col-md-6">
	                                    <h6>准备时间<span class="icon-danger">*</span></h6>
	                                    <div class="input-group border-input">
		                                    
											    <form:input path="prep" class="form-control border-input"/>
											 	<span class="input-group-addon"></span>
											    <form:select path="prep">
											    <form:option value=""></form:option>
											    <form:option value="second">second</form:option>
											    <form:option value="seconds">seconds</form:option>
											    <form:option value="minute">minute</form:option>
											    <form:option value="minutes">minutes</form:option>
											    <form:option value="hour">hour</form:option>
											    <form:option value="hours">hours</form:option>
											    </form:select>
											    <form:errors path="prep"/>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <h6>食谱 <span class="icon-danger">*</span></h6>
	                                <form:label path="formula">
								    	<form:textarea path="formula"  class="form-control textarea-limited" placeholder="最多输入1500字." rows="8" cols="60"  maxlength="1500" />
								    	<form:errors path="formula"/>
							    	</form:label>
	                                <h5><small><span id="textarea-limited-message" class="pull-right">1500 characters left</span></small></h5>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <input type="hidden" name="user_fav_recipes" value="${my_recipe.id}"/>
	                    <input type="hidden" name="recipe_ing" value="${my_recipe.id}"/>
						<input type="hidden" name="reviews" value="${review.id}"/>
						<input type="hidden" name="uploader" value="${currentUser.id}"/> 
	                    <div class="row buttons-row">
	                        <div class="col-md-4 col-sm-4">
	                          <a href="/profile" class="btn btn-outline-danger btn-block btn-round">取消</a>
	                        </div>
	                        <div class="col-md-4 col-sm-4">
	                            <button type="submit" class="btn btn-outline-primary btn-block btn-round">提交</button>
	                        </div>
	                    </div>
	                </form:form>
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

<!-- Core JS Files -->
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
<script src="../assets/js/popper.js" type="text/javascript"></script>
<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  for fileupload -->
<script src="../assets/js/jasny-bootstrap.min.js"></script>


<script src="../assets/js/paper-kit.js?v=2.1.0"></script>

</html>