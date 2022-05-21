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

</head>
<body>

<main class="contaiiner-fluid">

		<section class="header" id="header">
			<a href="/"><img src="images/spotr_logo.png"
				class="logo" id="logo" /></a>
				
			<div class="banner" id="banner">
			<span class="tagline" id="tagline">Local Fitness Finder</span>
			<span class="button" id="login"><a href="FIXME">Log In</a></span>
			<span class="button" id="new_account"><a href="FIXME">New User</a></span>
			</div>
		</section>


<h1>Congrats! This page loads!</h1>

${DEBUG}



</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>