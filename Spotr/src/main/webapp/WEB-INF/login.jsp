<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spotr : Local Fitness Finder</title>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<!-- ADD CSS FILES INTO THE PROJECT -->
<link rel="stylesheet" href="../css/main.css">

</head>
<body>

<main class="container-fluid">

		<section class="header" id="header">
			<div class="banner" id="banner">
			<a href="/"><img src="images/spotr_logo.png"
				class="logo" id="logo" /></a>
				
			<span class="tagline" id="tagline">Local Fitness Finder</span>
			<span class="button" id="login"><a href="FIXME">Log In</a></span>
			<span class="button" id="new_account"><a href="FIXME">New User</a></span>
			</div>
		</section>
	<section class="login" id="login">
	
	<label for="username">Username:</label>
	<input type="text" name="username" id="username"></br>
	<label for="password">Passeword:</label>
	<input type="password" name="password" id="password">
	
	</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>