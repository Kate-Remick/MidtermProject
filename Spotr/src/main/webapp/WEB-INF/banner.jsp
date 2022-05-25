<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<!-- ADD CSS FILES INTO THE PROJECT -->
<link rel="stylesheet" href="../css/banner.css">

</head>

<body>

	<div class="banner-wrapper">
		<section class="banner" id="section-banner">
			<div class="banner" id="div-banner">

				<div class="logo">
					<a href="viewCustomer.do"><img src="images/spotr_logo_sm.jpg" class="logo"
						id="logo" /></a>
				</div>
				
				<div class="tagline">
					<h1 class="tagline">Local Fitness	Finder</h1>
				</div>
				
				<div class="logout" id="div-logout">
					<span class="span-logout" id="logout"><a href="logout.do"
						id="logout_link">Logout</a></span>
				</div>
				
			</div>
		</section>
	</div>

	<!-- ADD BOOTSTRAP INTO THE PROJECT -->
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>