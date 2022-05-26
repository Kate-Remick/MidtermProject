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
		<section class="header">
			<div class="logo">
				<c:if test="${! empty loggedInUser}">
					<c:if test="${! empty customer }">
						<a href="viewCustomer.do"><img class="logo"
							src="../images/spotr_logo_sm.jpg" class="logo" id="logo" /></a>
					</c:if>
					<c:if test="${! empty facility }">
						<a href="viewFacility.do"><img class="logo"
							src="../images/spotr_logo_sm.jpg" class="logo" id="logo" /></a>
					</c:if>
				</c:if>
				<c:if test="${empty loggedInUser }">
						<a href="home.do"><img class="logo"
							src="../images/spotr_logo_sm.jpg" class="logo" id="logo" /></a>
				</c:if>
			</div>

			<div class="tagline">
				<h1 class="tagline">Local Fitness Finder</h1>
				<c:if test="${! empty loggedInUser}">
					<c:if test="${! empty customer }">
						<span class="buttons"><a href="viewCustomer.do" class="banner">Home Page</a><a href="logout.do" class="banner">Logout</a></span>
					</c:if>
					<c:if test="${! empty facility }">
						<span class="buttons"><a href="viewFacility.do" class="banner">Home Page</a><a href="logout.do" class="banner">Logout</a></span>
					</c:if>
				</c:if>
				<c:if test="${empty loggedInUser }">
						<span class="buttons"><a href="home.do" class="banner">Login
						Page</a></span>
				</c:if>
			</div>
		</section>
	</div>

	<!-- ADD BOOTSTRAP INTO THE PROJECT -->
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>