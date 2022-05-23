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
		<input type="text" name=name value="Name"> <br> 

		<label for="name">Mission statement:</label> 
		<input type="text" name=name value="Description"> <br> 
		
		<label for="brand">Brand of facility:</label> 
		<input type="text" name=name value="Brand"> <br> 
		
		<label for="ownerName">Owner of facility:</label> 
		<input type="text" name=name value="Owner Name"> <br> 
		 
		<label for="alwaysOpen">Is the facility 24/7:</label> 
		<input type="checkbox" name="Is facility 24/7" value="true"> <br>
		 
		<label for="price">Price ($) :</label>
		<input type="number" name=price value="$"> <br>
		
		<label for="url">Website Link:</label> 
		<input type="text" name=url value="URL"> <br>
		 
		<div class="mb-3">
		<label for="address1"><strong>Street Address 1:</strong></label>
		<input type="text" name="address1" id="address1"><br>
		</div>
		<div class="mb-3">
		<label for="address2"><strong>Street Address 2:</strong></label>
		<input type="text" name="address2" id="address2"><br>
		</div>
		<div class="mb-3">
		<label for="city"><strong>City:</strong></label>
		<input type="text" name="city" id="city">
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
		<input type="text" name="address1" id="address1"><br>
		</div>
		
		<p><strong>Facility Activities</strong></p>
	
		<div class="row  d-inline-flex">
	 
	 		<div class="col">
	 		<div class="form-group">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="weightlifting">
	        <label class="form-check-label" for="weightlifting">
	          Weightlifting
	        </label>
	    	</div>
	    </div>
	 
	 		<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="powerlifting">
	    	  <label class="form-check-label" for="powerlifting">
	      	  Powerlifting
	      	</label>
	   	 </div>
	
			<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="crossfit">
	    	  <label class="form-check-label" for="crossfit">
	      	  Powerlifting
	      	</label>
	   	 </div>
	
			
		</div>
	  
	  <form>
	 	<div class="row  d-inline-flex">
	 
	 		<div class="col">
	 		<div class="form-group">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="dancing">
	        <label class="form-check-label" for="dancing">
	          Dancing
	        </label>
	    	</div>
	    </div>
		
	 
	 		<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="swimming">
	    	  <label class="form-check-label" for="swimming">
	      	  Swimming
	      	</label>
	   	 </div>
	
	
			<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="running">
	    	  <label class="form-check-label" for="running">
	      	  Running
	      	</label>
	   	 </div>
	
		</div>
	 
		<div class="row  d-inline-flex">
	 
	 		<div class="col">
	 		<div class="form-group">
	      <div class="form-check">
	        <input class="form-check-input" type="checkbox" id="cardio">
	        <label class="form-check-label" for="cardio">
	          Cardio
	        </label>
	    	</div>
	    </div>
		
	 
	 		<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="calisthenics">
	    	  <label class="form-check-label" for="calisthenics">
	      	  Powerlifting
	      	</label>
	   	 </div>
	
	
			<div class="col">
	 		<div class="form-group">
		    <div class="form-check">
	  	    <input class="form-check-input" type="checkbox" id="yoga">
	    	  <label class="form-check-label" for="yoga">
	      	  Powerlifting
	      	</label>
	   	 </div>
	
		</div>	
		 
		<input type="submit" value="Create new Facility">
	</form><br>

	<a href="Home.do">Home</a>
	
</body>


</html>

<!-- 	-hidden field for login id
	-Address
		-same as customer
		-url
		
	-Activities
		-checkbox for each
	Submit (goes to createFacility.do, post) -->