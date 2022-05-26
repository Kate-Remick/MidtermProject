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
<link rel="stylesheet" href="css/main_backup.css">

</head>
<body>

<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>


	<section class="main" id="main">

	<div name="inputs" id="inputs" class="inputs">
	<form action="login.do" method="POST" name="login_form" class="login_form" id="login_form"> 
	<!-- CHANGE ACTION TO "login.do" AFTER TESTING -->
	<label for="username"><strong>Username:</strong></label>
	<input type="text" name="username" id="username"></br>
	<label for="password"><strong>Password:</strong></label>
	<input type="password" name="password" id="password"><br>
	<input type="submit" value="Log In">
	</form>
	<br>
	<br>
	<a href="create.do" name="new_account" id="new_account">New User? Click here!</a>
	</div>
	



</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>