<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Facility</title>
</head>


<body>

<form action="createFacility.do" method="POST">

		<input type="text" hidden="true" name="id" value="${login.id }">
		
		<label for="name">Name of facility:</label> 
		<input type="text" name=name value="${facility.name}"> <br> 
		
		<label for="brand">Brand of facility:</label> 
		<input type="text" name=name value="${facility.brand}"> <br> 
		
		<label for="ownerName">Owner of facility:</label> 
		<input type="text" name=name value="${facility.ownerName}"> <br> 
		 
		 
		<input type="submit" value="Create new Facility">
	</form><br>

	<a href="Home.do">Home</a>
	
</body>


</html>

<!-- 	-hidden field for login id
	-name
	-brand (franchiser)
	-ownerName
	-alwaysOpen
	-price (int)
	-Address
		-same as customer
		-url
	-Activities
		-checkbox for each
	-missionStatement
	Submit (goes to createFacility.do, post) -->