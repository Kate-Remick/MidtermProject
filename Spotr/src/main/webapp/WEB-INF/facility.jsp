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


<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="../css/facility.css">

</head>
<body>

<main class="container-fluid">

<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>

<br>
<br>
<br>
<div class="row col-sm-6 offset-3">
	<div  id="facilities" class="facilities">
		<div class="field-body">
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
		
		<br><br>
		</div>
	<a href="editFacility.do" class="col-sm-6 offset-3"><button class="btn btn-primary">Update Company Profile</button></a>
	<br>
	</div>
	<br>
	<br>
	<br>
	<div  id="facilities" class="facilities" >
	<div class="field-body">
		<table class="form-alignment">
		<th>Our Facility Provides:</th>
		<thead>
		</thead>
		<tbody>
		<c:forEach var="activity" items="${facility.activities}">
			<tr><td>${activity.name}</td></tr>
			</c:forEach>
		</tbody>
		</table>
	<br><br>
	</div>
	</div>
	</div>
	<br>




</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>