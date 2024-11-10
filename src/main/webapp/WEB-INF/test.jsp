<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Edit Recipe</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.min.css">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
     <link href="../assets/css/paper-kit.css?v=2.1.0" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
</head>
<!--<body class="add-product">
	<div class="wrapper">
	    <div class="main">
	        <div class="section">
	            <div class="container">
	                <h3> Edit Recipe</h3>
	                <form:form method="POST" action="/update/${my_recipe.id}" modelAttribute="my_recipe" enctype="multipart/form-data">
	                    <div class="row">
	                        <div class="col-md-5 col-sm-5">
	                            <h6>Recipe Image</h6>
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
	                                <span class="btn btn-outline-default btn-round btn-file"><span class="fileinput-new">Upload image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
	                                <a href="#paper-kit" class="btn btn-link btn-danger fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
	                              </div>
	                            </div>
	                        </div>
	                        
	                        <div class="col-md-7 col-sm-7">
	                            <div class="form-group">
	                                <h6>Name <span class="icon-danger">*</span></h6>
	                                <form:label path="title">
								    	<form:input path="title" class="form-control border-input" placeholder="enter the product name here..."/>
								    	<form:errors path="title"/>
							    	</form:label>
	                            </div>
	                            <div class="form-group">
	                            <h6>Description<span class="icon-danger">*</span></h6>
	                            <form:label path="description">
								    <form:textarea path="description" class="form-control border-input"/>
								    <form:errors path="description"/>
							    </form:label>
							   </div>
	                            <div class="form-group">
	                                <h6>Ingredients<span class="icon-danger">*</span></h6>
	                                <input type="text" name="ing" class="form-control border-input">
	                      
	                            </div>
	                            <div class="row price-row">
	                                <div class="col-md-6">
	                                    <h6>Preparation Time<span class="icon-danger">*</span></h6>
	                                    <div class="input-group border-input">
		                                    
											    <form:input path="prep" class="form-control border-input"/>
											 	<span class="input-group-addon"></span>
											    <form:select path="prep">
											    <form:option value=""></form:option>
											    <form:option value="seconds">second()s)</form:option>
											    <form:option value="minute">minute(s)</form:option>
											    <form:option value="hours">hour(s)</form:option>
											    </form:select>
											    <form:errors path="prep"/>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <h6>Recipe <span class="icon-danger">*</span></h6>
	                                <form:label path="formula">
								    	<form:textarea path="formula"  class="form-control textarea-limited" placeholder="This is a textarea limited to 250 characters." rows="8" cols="60"  maxlength="250" />
								    	<form:errors path="formula"/>
							    	</form:label>
	                                <h5><small><span id="textarea-limited-message" class="pull-right">250 characters left</span></small></h5>
	                            </div>
	                        </div>
	                    </div>
						
						<input type="hidden"  path="uploader" name="uploader" value="${currentUser.id}"/>
						<input type="hidden"  path="uploader" name="recipes" value="${my_recipe.id}"/>  
	                    <div class="row buttons-row">
	                        <div class="col-md-4 col-sm-4">
	                          <a href="/" class="btn btn-outline-danger btn-block btn-round">Cancel</a>
	                        </div>
	                        <div class="col-md-4 col-sm-4">
	                            <button type="submit" class="btn btn-outline-primary btn-block btn-round">Submit</button>
	                        </div>
	                    </div>
	                </form:form>
	                <p>${currentUser.id }</p>
	            </div>
	        </div>
	    </div>
	</div>

	<footer class="footer footer-black"></footer>

</body>-->
<body class="add-product">
	<nav class="navbar navbar-expand-lg fixed-top bg-danger">
		<div class="container">
			<div class="navbar-translate">
				<div class="navbar-header">
					<a class="navbar-brand" href="/home">Food On My Mind</a>
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
						<a class="nav-link" href="/home" data-scroll="true" href="javascript:void(0)">Dashboard</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/profile" data-scroll="true" href="javascript:void(0)">View Profile</a>
					</li>
					<li class="nav-item">
						<form id="logoutForm" method="POST" action="/logout">
	        				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        				<button type="submit" class="btn btn-round btn-danger" >
							<i class="fas fa-sign-out-alt"></i> Logout
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
	                <h2 id="recipe_heading">Edit Recipe</h2>
	                <form:form method="POST" action="/update/${my_recipe.id}" modelAttribute="my_recipe" enctype="multipart/form-data" >
	                    <div class="row">
	                        <div class="col-md-5 col-sm-5">
	                            <h6>Recipe Image</h6>
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
	                                <span class="btn btn-outline-default btn-round btn-file"><span class="fileinput-new">Upload image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
	                                <a href="#paper-kit" class="btn btn-link btn-danger fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
	                              </div>
	                            </div>
	                            <div id="gif" >
	                            	<img src="/images/bowl2.gif">
	                            </div>
	                        </div>
	                        
	                        <div class="col-md-7 col-sm-7">
	                            <div class="form-group">
	                                <h6>Name <span class="icon-danger">*</span></h6>
	                                <form:label path="title">
								    	<form:input path="title" class="form-control border-input" placeholder="recipe name here..."/>
								    	<form:errors path="title"/>
							    	</form:label>
	                            </div>
	                            <div class="form-group">
	                            <h6>Description<span class="icon-danger">*</span></h6>
	                            <form:label path="description" >
								    <form:textarea path="description" class="form-control border-input" rows="6" cols="40" placeholder="what's special about this recipe..."/>
								    <form:errors path="description"/>
							    </form:label>
							   </div>
	                            <div class="form-group">
	                                <h6>Ingredients<span class="icon-danger">*</span></h6>
	                                <small>Name of each ingredient must be separated by ( , )</small>
	                                <input type="text" name="ing" class="form-control border-input" placeholder="e.g (1 cup milk,2 tbsp sugar)">
	                      
	                            </div>
	                            <div class="row price-row">
	                                <div class="col-md-6">
	                                    <h6>Preparation Time<span class="icon-danger">*</span></h6>
	                                    <div class="input-group border-input">
		                                    
											    <form:input path="prep" class="form-control border-input"/>
											 	<span class="input-group-addon"></span>
											    <form:select path="prep">
											    <form:option value=""></form:option>
											    <form:option value="seconds">second()s)</form:option>
											    <form:option value="minute">minute(s)</form:option>
											    <form:option value="hours">hour(s)</form:option>
											    </form:select>
											    <form:errors path="prep"/>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <h6>Recipe <span class="icon-danger">*</span></h6>
	                                <form:label path="formula">
								    	<form:textarea path="formula"  class="form-control textarea-limited" placeholder="This is a textarea limited to 250 characters." rows="8" cols="60"  maxlength="250" />
								    	<form:errors path="formula"/>
							    	</form:label>
	                                <h5><small><span id="textarea-limited-message" class="pull-right">250 characters left</span></small></h5>
	                            </div>
	                        </div>
	                    </div>
	
						<input type="hidden"  path="uploader" name="uploader" value="${currentUser.id}"/> 
	                    <div class="row buttons-row">
	                        <div class="col-md-4 col-sm-4">
	                          <a href="/profile" class="btn btn-outline-danger btn-block btn-round">Cancel</a>
	                        </div>
	                        <div class="col-md-4 col-sm-4">
	                            <button type="submit" class="btn btn-outline-primary btn-block btn-round">Submit</button>
	                        </div>
	                    </div>
	                </form:form>
	            </div>
	        </div>
	    </div>
	</div>

	<footer class="footer footer-gray">
	
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