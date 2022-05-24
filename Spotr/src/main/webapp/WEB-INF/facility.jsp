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
	<div name="facility" id="facility" class="facility">
		<table>
		<tr><td class="facility_labels"><strong>Company:</strong></td><td class="facility_data">${facility.name}</td></tr>
		<tr><td class="facility_labels"><strong>Franchiser:</strong></td><td class="facility_data">${facility.brand}</td></tr>
		<tr><td class="facility_labels"><strong>Owner:</strong></td><td class="facility_data">${facility.ownerName}</td></tr>
		<tr><td class="facility_labels"><strong>Address:</strong></td><td class="facility_data">${facility.address}</td></tr>
		<tr><td class="facility_labels"><strong>Phone Number:</strong></td><td class="facility_data">${facility.address.phone}</td></tr>
		<tr><td class="facility_labels"><strong>Email:</strong></td><td class="facility_data">${facility.address.email}</td></tr>
		<tr><td class="facility_labels"><strong>Website:</strong></td><td class="facility_data">${facility.address.url}</td></tr>
		<tr><td class="facility_labels"><strong>Site has trainers:</strong></td><td class="facility_data">${facility.hasTrainers}</td></tr>
		<tr><td class="facility_labels"><strong>Site open 24 hours:</strong></td><td class="facility_data">${facility.alwaysOpen}</td></tr>
		<tr><td class="facility_labels"><strong>Price:</strong></td><td class="facility_data">$${facility.price}</td></tr>
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
	
	</div>
	<br>

</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>