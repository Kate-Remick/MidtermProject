<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Facility Search</title>
</head>
<body>
<h3>${addedMessage }</h3>
	<div class="findBy">
		<h3>Facilities matching your search</h3>
		<label>Search by method:</label>
		<form action="findFacilities.do" method="post">
			<label for="category">Category</label><select name="category">
				<c:forEach var="category" items="${categories}">
					<option value="${category }">${category.title}</option>
				</c:forEach>
			</select>
			<button type="submit">Find by category</button>
		</form>
		<form action="findFacilities.do" method="post">
			<label for="activity">Activity</label><select name="activity">
				<c:forEach var="activity" items="${activities}">
					<option value="${activity }">${activity.name}</option>
				</c:forEach>
			</select>
			<button type="submit">Find by activity</button>
		</form>
		<form action="findFacilities.do" method="post">
			<label>Find facilities near me</label> <input type="hidden"
				name="address" value="${customer.address}" />
			<button type="submit">Find by location</button>
		</form>
	</div>
	<div class="results">
		<label for="resultsTable">Search Results:</label>
		<table id="resultsTable">

			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Always Open</th>
				<th>Address</th>
				<th>Add Facility</th>
			</tr>
			<c:forEach var="facility" items="${facilities }">
				<tr>
					<th>${facility.name }</th>
					<th>${facility.price }</th>
					<th><c:if test="${facility.alwaysOpen }">Yes</c:if><c:if test="${!facility.alwaysOpen }">No</c:if></th>
					<th>${facility.address}</th>
					<th><a href="addFacilities.do?facilityId=${facility.id}"><button>Add Facility</button></a></th>
				</tr>
			</c:forEach>
			<c:forEach var="facility" items="${preferredFacilities }">
				<tr>
					<th>${facility.name }</th>
					<th>${facility.price }</th>
					<th><c:if test="${facility.alwaysOpen }">Yes</c:if><c:if test="${!facility.alwaysOpen }">No</c:if></th>
					<th>${facility.address}</th>
					<th><a href="addFacilities.do?facilityId=${facility.id}"><button>Add Facility</button></a></th>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>