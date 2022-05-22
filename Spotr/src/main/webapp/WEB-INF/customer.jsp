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
	<section class="main" id="main">

<h1>${DEBUG}</h1>
</br>
</br>
</br>

<!-- 
FACILITIES
USERNAME
FIRST NAME
LAST NAME
JOURNAL LINKS
GOALS
ACTIVITES & SKILL LEVELS
-->
	<div name="customer" id="customer" class="customer">
		<table>
		<tr><td class="customer_labels">Username:</td><td class="customer_data">FlashGordon</td></tr>
		<tr><td class="customer_labels">First Name:</td><td class="customer_data">Flash</td></tr>
		<tr><td class="customer_labels">Last Name:</td><td class="customer_data">Gordon</td></tr>		
		</table>
	</div>
	



</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>