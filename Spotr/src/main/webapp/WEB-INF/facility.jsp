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
		<tr><td class="facility_labels">Company:</td><td class="facility_data">GloboGym Denver</td></tr>
		<tr><td class="facility_labels">Franchiser:</td><td class="facility_data">GloboGym International</td></tr>
		<tr><td class="facility_labels">Owner:</td><td class="facility_data">Ben Stiller</td></tr>
		<tr><td class="facility_labels">Address:</td><td class="facility_data">100 Main Street suite 202, Denver, CO 80111</td></tr>
		<tr><td class="facility_labels">Site has trainers:</td><td class="facility_data">YES</td></tr>
		<tr><td class="facility_labels">Site open 24 hours:</td><td class="facility_data">YES</td></tr>
		<tr><td class="facility_labels">Price:</td><td class="facility_data">$10.00</td></tr>
		</table>
	</br>
	<a href="editFacility.do"><button>Update Company Profile</button></a>
	</div>
	</br>
	<div name="activities" id="activities" class="activities">
		<table>
		<thead>
		<th>Acitivity</th>
		</thead>
		<tbody>
			<tr><td>Weightlifting</td></tr>
			<tr><td>CrossFit</td></tr>
			<tr><td>Powerlifting</td></tr>

		</tbody>
		</table>
	</br>
	<a href="editActivities.do"><button>Update Company Activity Offerings</button></a>
	</div>
	</br>

</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>