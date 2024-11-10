<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<h1>All Recipes</h1>
<table>
	<tr>
    <th>Recipe</th>
    <th>Actions</th>
  </tr>
  <c:forEach items="${allRecipes}" var="recipe">
	<tr>
	<td><a href="/show/recipe/${recipe.id}">${recipe.title}</a></td>
	<td><a href="/edit/${recipe.id}">Edit</a>| <a href="/delete/${recipe.id}">Delete</a></td>
		
	</tr>
	</c:forEach>

</table>

</body>
</html>