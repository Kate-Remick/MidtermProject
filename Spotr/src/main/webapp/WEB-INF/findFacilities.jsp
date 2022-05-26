<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facility Search</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<link rel="stylesheet" href="../css/updateFacility.css">
<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="../css/findFacilities.css">

</head>
<body>

	<main class="container-fluid">
	
		<div class="container-fluid">
			<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>
					
				</div>
			</section>
		</div>
		
		
		<div class="facilities">
			<h3 id="addedFacility">${addedMessage }</h3>
			<div id="findBy">
				<label id="findFacilityText">Search by method:</label>

				<form action="findFacilities.do" method="post">
					<label id="findFacilityText" for="category">Category</label><select name="category">
						<c:forEach var="category" items="${categories}">
							<option value="${category.id }">${category.title}</option>
						</c:forEach>
					</select>
					<button type="submit">Find by category</button>
				</form>

				<form action="findFacilities.do" method="post">
					<label id="findFacilityText" for="activity">Activity</label><select name="activity">
						<c:forEach var="activity" items="${activities}">
							<option value="${activity.id }">${activity.name}</option>
						</c:forEach>
					</select>
					<button type="submit">Find by activity</button>
				</form>

				<form action="findFacilities.do" method="post">
					<label id="findFacilityText">Find facilities near me</label> <input type="hidden"
						name="address" value="${customer.address.id}" />
					<button type="submit">Find by location</button>
				</form>
			</div>
			
			<div id="results" class="results field-body">
				<label for="resultsTable">Search Results:</label>
				<table id="resultsTable">

					<tr>
						<th>Name</th>
						<th>Price</th>
						<th>Always Open</th>
						<th>Address</th>
						<th>View Facility</th>
						<th>Add Facility</th>
					</tr>
					<c:if test="${! empty facilities }">
						<c:forEach var="facility" items="${facilities }">
							<tr>
								<th>${facility.name }</th>
								<th>${facility.price }</th>
								<th><c:if test="${facility.alwaysOpen }">Yes</c:if> <c:if
										test="${!facility.alwaysOpen }">No</c:if></th>
								<th>${facility.address}</th>
								<th><a href="customerViewFacility.do?facilityId=${facility.id}"><button>View
											Facility Info</button></a></th>
								<th><a href="addFacilities.do?facilityId=${facility.id}"><button>Add
											Facility</button></a></th>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${! empty preferredFacilities }">
						<c:forEach var="facility" items="${preferredFacilities }">
							<tr>
								<th>${facility.name }</th>
								<th>${facility.price }</th>
								<th><c:if test="${facility.alwaysOpen }">Yes</c:if> <c:if
										test="${!facility.alwaysOpen }">No</c:if></th>
								<th>${facility.address}</th>
								<th><a href="customerViewFacility.do?facilityId=${facility.id}"><button>View
											Facility Info</button></a></th>
								<th><a href="addFacilities.do?facilityId=${facility.id}"><button>Add
											Facility</button></a></th>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			</div>
			
		
	</main>
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>