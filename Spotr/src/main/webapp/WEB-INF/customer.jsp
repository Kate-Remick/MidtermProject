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
<link rel="stylesheet" href="../css/customer.css">

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
		<tr><td class="customer_labels">Username:</td><td class="customer_data">${customer.login.username}</td></tr>
		<tr><td class="customer_labels">First Name:</td><td class="customer_data">${customer.firstName}</td></tr>
		<tr><td class="customer_labels">Last Name:</td><td class="customer_data">${customer.lastName}</td></tr>		
		</table>
	</br>
	<a href="editCustomerInfo.do"><button>Update Personal Profile</button></a>
	<a href="viewJournal.do"><button>Your Fitness Journal</button></a>
	</div>
	</br>
	<a href="findFacilities.do"><button>Find Fitness Facilities</button></a>
	<div name="facilities" id="facilities" class="facilities">
		<table>
		<thead>
		<th>Fitness FIrm</th><th>Location</th><th></th>
		</thead>
		<tbody>
		<c:forEach var="facility" items="${customer.facilities}">
			<tr><td>${facility.name}</td><td>${facility.address}</td><td> <a href="removeFacilities.do?facilityId=${facility.id}"><button>Remove Facility</button></a></td></tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	</br>
	<div name="activities" id="activities" class="activities">
		<table>
		<thead>
		<th>Acitivity</th><th>Goal</th><th></th>
		</thead>
		<tbody>
		<c:if test="${! empty customer.customerActivities }">
		<c:forEach var="customerActivity" items="${customer.customerActivities}">
		<!-- FIX MEEEEEEEEEEEEEE -->
			<tr><td>${customerActivity.activity.name}</td><td>${customerActivity.skillLevel}</td>
		</c:forEach>
		</c:if>
		</tbody>
		</table>
	</br>
	
	</div>
	</br>
	



</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>