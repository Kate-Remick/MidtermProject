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


<link rel="stylesheet" href="../css/templateCopy.css">
<link rel="stylesheet" href="../css/customerFacilityView.css">

</head>
<body>

	<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>

		<br> <br> <br>
		<div class="row col-sm-6 offset-3">
			<div id="facilities" class="facilities">
				<div class="field-body">
					<table>
						<tr>
							<td class="facility_labels">Company:</td>
							<td class="facility_data">${cFacility.name}</td>
						</tr>
						<tr>
							<td class="facility_labels">Franchiser:</td>
							<td class="facility_data">${cFacility.brand}</td>
						</tr>
						<tr>
							<td class="facility_labels">Owner:</td>
							<td class="facility_data">${cFacility.ownerName}</td>
						</tr>
						<tr>
							<td class="facility_labels">Address:</td>
							<td class="facility_data">${cFacility.address}</td>
						</tr>
						<tr>
							<td class="facility_labels">Phone Number:</td>
							<td class="facility_data">${cFacility.address.phone}</td>
						</tr>
						<tr>
							<td class="facility_labels">Email:</td>
							<td class="facility_data">${cFacility.address.email}</td>
						</tr>
						<tr>
							<td class="facility_labels">Website:</td>
							<td class="facility_data">${cFacility.address.url}</td>
						</tr>
						<tr>
							<td class="facility_labels">Site has trainers:</td>
							<td class="facility_data">${cFacility.hasTrainers}</td>
						</tr>
						<tr>
							<td class="facility_labels">Site open 24 hours:</td>
							<td class="facility_data">${cFacility.alwaysOpen}</td>
						</tr>
						<tr>
							<td class="facility_labels">Price:</td>
							<td class="facility_data">$${cFacility.price}</td>
						</tr>
					</table>
				</div>
				<br>
				<c:if test="${! empty cFacility.missionStatement }">
					<div id="facilities" class="facilities">
						<div class="field-body">
							<table class="form-alignment">
								<th>Our Mission:</th>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>${cFacility.missionStatement}</td>
									</tr>
								</tbody>
							</table>
							<br> <br>
						</div>
						<br>
				</c:if>
				<div id="facilities" class="facilities">
						<div class="field-body">
							<table class="form-alignment">
								<th>Our Facility Provides:</th>
								<thead>
								</thead>
								<tbody>
									<c:forEach var="activity" items="${cFacility.activities}">
										<tr>
											<td>${activity.name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br> <br>
						</div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-4">
								<br>

								<c:if test="${!customer.facilities.contains(cFacility) }">
									<a href="addFacilities.do?facilityId=${cFacility.id }"
										class=" col-sm-6 offset-3"><button class="btn btn-primary">Add
											Facility</button></a>
								</c:if>
								<c:if test="${customer.facilities.contains(cFacility) }">
									<a href="removeFacilities.do?facilityId=${cFacility.id }"
										class=" col-sm-6 offset-3"><button class="btn btn-primary">Remove
											Facility</button></a>
								</c:if>
							</div>
							<br>
						</div>
						<div class="col-sm-4"></div>
						<br>
					</div>
				</div>
			</div>
			<br>
	</main>

	<!-- ADD BOOTSTRAP INTO THE PROJECT -->
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>