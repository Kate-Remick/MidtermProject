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
<link rel="stylesheet" href="../css/facility.css">

</head>
<body>

<main class="container-fluid">

		<section class="header" id="header">
			<div class="banner" id="banner">
			<a href="/"><img src="images/spotr_logo.png"
				class="logo" id="logo" /></a>
				
			<span class="tagline" id="tagline">Local Fitness Finder</span>
			<div class="logout"><span class="button" id="logout"><a href="logout.do" id="logout_link">Logout</a></span></div>
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
	<div name="facility" id="facility" class="facility">
		<table>
		<tr><td class="facility_labels">Company:</td><td class="facility_data">${facility.name}</td></tr>
		<tr><td class="facility_labels">Franchiser:</td><td class="facility_data">${facility.brand}</td></tr>
		<tr><td class="facility_labels">Owner:</td><td class="facility_data">${facility.ownerName}</td></tr>
		<tr><td class="facility_labels">Address:</td><td class="facility_data">${facility.address}</td></tr>
		<tr><td class="facility_labels">Phone Number:</td><td class="facility_data">${facility.address.phone}</td></tr>
		<tr><td class="facility_labels">Email:</td><td class="facility_data">${facility.address.email}</td></tr>
		<tr><td class="facility_labels">Website:</td><td class="facility_data">${facility.address.url}</td></tr>
		<tr><td class="facility_labels">Site has trainers:</td><td class="facility_data">${facility.hasTrainers}</td></tr>
		<tr><td class="facility_labels">Site open 24 hours:</td><td class="facility_data">${facility.alwaysOpen}</td></tr>
		<tr><td class="facility_labels">Price:</td><td class="facility_data">$${facility.price}</td></tr>
		</table>
	<br>
	<a href="editFacility.do"><button>Update Company Profile</button></a>
	</div>
	<br>
	<div name="activities" id="activities" class="activities">
		<table>
		<th>Our Facility Provides:</th>
		<thead>
		</thead>
		<tbody>
		<c:forEach var="activity" items="${facility.activities}">
			<tr><td>${activity.name}</td></tr>
			</c:forEach>
		</tbody>
		</table>
	<br>
<<<<<<< HEAD
	
=======
	<a href="editFacility.do"><button>Update Company Activity Offerings</button></a>
>>>>>>> c604c0cd83a7dc51f5cfa6a197100f7c06f9c9a8
	</div>
	<br>

</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>