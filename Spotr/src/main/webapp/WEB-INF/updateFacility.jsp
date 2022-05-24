<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Facility</title>

<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="css/new_customer.css">

</head>

<body>

<main class="container-fluid">

		<div class="container-fluid">
		<section class="header" id="header">
			<div class="banner" id="banner">
			<a href="/"><img src="images/spotr_logo.png"
				class="logo" id="logo" /></a>
				
			<span class="tagline" id="tagline">Local Fitness Finder</span>
			<div class="logout"><span class="button" id="logout"><a href="logout.do" id="logout_link">Logout</a></span></div>
			</div>
		</section>
		</div>
		

		<div name="inputs" id="inputs" class="col-sm-6 offset-3">
		<div class="row d-inline-flex">
		<span class="label"><label for="disabledUsername"><strong>Username:</strong></label></span>
		<input disabled type="text" id="disabledUsername" class="form-control" placeholder="${loggedInUser.username}">	
		</div> <br>

		<form action="editFacility.do" method="POST" name="editFacility" class="editFacility" id="editFacility">
		
		<div class="row d-inline-flex">
		<span class="label"><label for="name"><strong>Name of facility:</strong></label></span>
		<input type="text" name="name" id="name" class="form-control" value="${facility.name }">
		</div> <br>
		
		<div class="row d-inline-flex">
		<span class="label"><label for="missionStatement"><strong>Mission statement:</strong></label></span>
		<input type="text" name="missionStatement" id="missionStatement" class="form-control" value="${facility.missionStatement }">
		</div> <br>
		
		<div class="row d-inline-flex">
		<span class="label"><label for="brand"><strong>Brand of facility:</strong></label></span>
		<input type="text" name="brand" id="brand" class="form-control" value="${facility.brand }">
		</div> <br>
		
		<div class="row d-inline-flex">
		<span class="label"><label for="ownerName"><strong>Owner of facility:</strong></label></span>
		<input type="text" name="ownerName" id="ownerName" class="form-control" value="${facility.ownerName }">
		</div> <br>
		
		<div class="row d-inline-flex">
	    <input value="${true}" class="form-check-input" name="hasTrainers" type="checkbox" id="hasTrainers">
	    <label class="form-check-label" for="hasTrainers" >
	          Does the facility have personal trainers:
	    </label></div>
	    	
	    <div class="row d-inline-flex">
	    <input value="${true}" class="form-check-input" name="alwaysOpen" type="checkbox" id="alwaysOpen">
	    <label class="form-check-label" for=alwaysOpen>
	          Is the facility open 24/7:
	    </label></div>
		
		<div class="row d-inline-flex">
		<span class="label"><label for="price"><strong>Price ($) :</strong></label></span>
		<input type="number" name="price" id="price" class="form-control" value="${facility.price }">
		</div> <br>
		 
		<div class="mb-3">
		<label for="address1"><strong>Street Address 1:</strong></label>
		<input type="text" name="streetAddress1" id="address1" value="${facility.address.streetAddress1 }"><br>
		</div>
		<div class="mb-3">
		<label for="address2"><strong>Street Address 2:</strong></label>
		<input type="text" name="streetAddress2" id="address2" value="${facility.address.streetAddress2 }"><br>
		</div>
		<div class="mb-3">
		<label for="city"><strong>City:</strong></label>
		<input type="text" name="city" id="city" value="${facility.address.city }">
		</div>
		<div class="mb-3">
		<label for="state"><strong>State:</strong></label>
		<select name="state" id="state">
	    <option value="">--Please choose an option--</option>
	    <option value="AL">AL</option>
	    <option value="AK">AK</option>
	    <option value="AZ">AZ</option>
	    <option value="AR">AR</option>
	    <option value="CA">CA</option>
	    <option value="CO">CO</option>
	    <option value="CT">CT</option>
	    <option value="DC">DC</option>
	    <option value="DE">DE</option>
	    <option value="FL">FL</option>
	    <option value="GA">GA</option>
	    <option value="HI">HI</option>
	    <option value="ID">ID</option>
	    <option value="IL">IL</option>
	    <option value="IN">IN</option>
	    <option value="IA">IA</option>
	    <option value="KS">KS</option>
	    <option value="KY">KY</option>
	    <option value="LA">LA</option>
	    <option value="ME">ME</option>
	    <option value="MD">MD</option>
	    <option value="MA">MA</option>
	    <option value="MI">MI</option>
	    <option value="MN">MN</option>
	    <option value="MS">MS</option>
	    <option value="MO">MO</option>
	    <option value="MT">MT</option>
	    <option value="NE">NE</option>
	    <option value="NV">NV</option>
	    <option value="NH">NH</option>
	    <option value="NJ">NJ</option>
	    <option value="NM">NM</option>
	    <option value="NY">NY</option>
	    <option value="NC">NC</option>
	    <option value="ND">ND</option>
	    <option value="OH">OH</option>
	    <option value="OK">OK</option>
	    <option value="OR">OR</option>
	    <option value="PA">PA</option>
	    <option value="RI">RI</option>
	    <option value="SC">SC</option>
	    <option value="SD">SD</option>
	    <option value="TN">TN</option>
	    <option value="TX">TX</option>
	    <option value="UT">UT</option>
	    <option value="VT">VT</option>
	    <option value="VA">VA</option>
	    <option value="WA">WA</option>
	    <option value="WV">WV</option>
	    <option value="WI">WI</option>
	    <option value="WY">WY</option>
	   	</select>
		</div>
		<div class="mb-3">
		<label for="zip"><strong>Zip Code:</strong></label>
		<input type="text" name="zip" id="zip" value="${facility.address.zip }"><br>
		</div>
		
		<div class="mb-3">
		<label for="phone"><strong>Phone number:</strong></label>
		<input type="text" name="phone" id="phone" value="${facility.address.phone }"><br>
		</div>
		
		<div class="mb-3">
		<label for="email"><strong>Email:</strong></label>
		<input type="text" name="email" id="email" value="${facility.address.email }"><br>
		</div>
		
		<div class="mb-3">
		<label for="url"><strong>Website Link:</strong></label>
		<input type="text" name="url" id="url" value="${facility.address.url }"><br>
		</div>
		
		<p><strong>Facility Activities</strong></p>
		
		<div class="row  d-inline-flex">
		<c:forEach var="activity" items="${activities}">
		
	 
	 		<div class="col">
	 		<div class="form-group">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" 
	        name="activityarray" value="${activity.id}">
	        <label class="form-check-label" for="activityarray">
	          ${activity.name } </label>
	    	</div>
	    </div>
	    </div>
	 </c:forEach>
	    </div>
		
		<input type="submit" value="Edit Facility" class="btn btn-primary">
	</form><br>
	</div>
	</main>
</body>

</html>