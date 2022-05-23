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
		<tr><td class="customer_labels">Username:</td><td class="customer_data">FlashGordon</td></tr>
		<tr><td class="customer_labels">First Name:</td><td class="customer_data">Flash</td></tr>
		<tr><td class="customer_labels">Last Name:</td><td class="customer_data">Gordon</td></tr>		
		</table>
	</br>
	<a href="editCustomer.do"><button>Update Personal Profile</button></a>
	<a href="journal.do"><button>Your Fitness Journal</button></a>
	</div>
	</br>
	
	<div name="facilities" id="facilities" class="facilities">
		<table>
		<thead>
		<th>Fitness FIrm</th><th>Location</th>
		</thead>
		<tbody>
			<tr><td>Test Facility</td><td>101 Main St Suite 100, Denver, CO 80111</td></tr>

		</tbody>
		</table>
	</br>
	<a href="editFacilities.do"><button>Update Fitness Locations</button></a>
	</div>
	</br>
	<div name="activities" id="activities" class="activities">
		<table>
		<thead>
		<th>Acitivity</th><th>Goal</th>
		</thead>
		<tbody>
			<tr><td>Test Activity</td><td>Bench 500 like Ronnie Coleman</td></tr>

		</tbody>
		</table>
	</br>
	<a href="editActivities.do"><button>Update Fitness Activities</button></a> <a href="editGoals.do"><button>Update Fitness Goals</button></a>
	</div>
	</br>
	



</section>
</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>