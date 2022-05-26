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

</head>
<body>

	<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>

		<br>

		<div class="col-sm-6 offset-3">

			<div id="customer-section" class="field-body">
				<div class="row">
					<div class="col">
						<strong>Username:</strong>
					</div>
					<div class="col">${customer.login.username}</div>
				</div>
				<div class="row">
					<div class="col">
						<strong>First Name:</strong>
					</div>
					<div class="col">${customer.firstName}</div>
				</div>
				<div class="row">
					<div class="col">
						<strong>Last Name:</strong>
					</div>
					<div class="col">${customer.lastName}</div>
				</div>
			</div>
			<a href="editCustomerInfo.do"><button>Update Personal
					Profile</button></a> <a href="viewJournal.do"><button>Your Fitness
					Journal</button></a> <br>

			<div id="facilities-section" class="field-body">
				<div class="row">
					<div class="col">
						<strong>Fitness Firm</strong>
					</div>
					<div class="col">
						<strong>Address</strong>
					</div>
				</div>
				<c:forEach var="facility" items="${customer.facilities}">
					<div class="row">
						<div class="col">${facility.name}</div>
						<div class="col">${facility.address}</div>
						<div class="col">
							<a href="customerViewFacility.do?facilityId=${facility.id}"><button>View Facility</button></a>
						</div>
						<div class="col">
							<a href="removeFacilities.do?facilityId=${facility.id}"><button>Remove
									Facility</button></a>
						</div>
					</div>
				</c:forEach>
			</div>
			<a href="findFacilities.do"><button>Find Fitness
					Facilities</button></a> <br>


			<div id="activities-section" class="field-body">
				<div class="row">
					<div class="col">
						<strong>Activity</strong>
					</div>
					<div class="col">
						<strong>Skill Level</strong>
					</div>
				</div>
				<c:if test="${! empty customer.customerActivities }">
					<c:forEach var="customerActivity"
						items="${customer.customerActivities}">
						<div class="row">
							<div class="col">${customerActivity.activity.name}</div>
							<div class="col">
							<c:choose>
								<c:when test="${customerActivity.skillLevel ==1 }">Beginner</c:when>
								<c:when test="${customerActivity.skillLevel ==2 }">Intermediate</c:when>
								<c:when test="${customerActivity.skillLevel ==3 }">Advanced</c:when>
							
							</c:choose>
							
							</div>
						</div>
					</c:forEach>
				</c:if>
				<br>

			</div>
			<br>



		</div>
	</main>

	<!-- ADD BOOTSTRAP INTO THE PROJECT -->
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>