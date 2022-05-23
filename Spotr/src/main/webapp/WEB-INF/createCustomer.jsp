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
			<span class="button" id="login"><a href="logout.do">Logout</a></span>
			</div>
		</section>
		</div>
		
	<div name="inputs" id="inputs" class="col-sm-6 offset-3">
	<form action="createCustomer.do" method="POST" name="new_customer_form" class="new_customer_form" id="new_customer_form">
  <div class="form-group">
  
  <div class="row d-inline-flex"><input !important hidden type="text" name="id" id="id" value="id"></div>
	
	<div class="row d-inline-flex">
	<span class="label"><label for="disabledUsername"><strong>Username:</strong></label></span>
	<input disabled type="text" id="disabledUsername" class="form-control" placeholder="username goes here">	
	</div></br>
	<div class="row d-inline-flex">
	<span class="label"><label for="firstName"><strong>First Name:</strong></label></span>
	<input type="text" name="firstName" id="firstName" class="form-control" placeholder="First Name">
	</div></br>
	<div class="row d-inline-flex">
	<label for="lastName"><strong>Last Name:</strong></label>
	<input type="text" name="lastName" id="lastName">
	</div><br>
	<div class="row d-inline-flex">
	<label for="birthDate"><strong>Date of Birth:</strong></label>
	<input type="date" name="birthDate" id="birthDate">
	</div><br>
	<div class="row  d-inline-flex">
	<label for="gender"><strong>Gender:</strong></label>
	<select name="name" id="gender">
    <option value="">--Please choose an option--</option>
    <option value="male">Male</option>
    <option value="female">Female</option>
    <option value="other">Something Else/Choose Not to Say</option>
	</select>
	</div></br>
	<div class="row  d-inline-flex">
	<label for="streetAddress1"><strong>Street Address 1:</strong></label>
	<input type="text" name="streetAddress1" id="streetAddress1"><br>
	</div>
	<div class="row  d-inline-flex">
	<label for="streetAddress2"><strong>Street Address 2:</strong></label>
	<input type="text" name="streetAddress2" id="streetAddress2"><br>
	</div>
	<div class="row  d-inline-flex">
	<label for="city"><strong>City:</strong></label>
	<input type="text" name="city" id="city">
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
	<label for="zip"><strong>Zip Code:</strong></label>
	<input type="text" name="zip" id="zip"><br>
	</div>
	
	<p><strong>Choose Your Preferred Activities</strong></p>
	
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
	
		<select class="skill-level" name="weightliftingSkill" id="weightliftingSkill">
	    <option value="">--Please choose a skill level--</option>
	    <option value="1">Beginner</option>
	    <option value="2">Intermediate</option>
	    <option value="3">Advanced</option>
		</select>
		</div>
 
 		<c:forEach var="activity" items="${activities }">
 		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="powerlifting" value="${activity }">
    	  <label class="form-check-label" for="powerlifting">
      	  Powerlifting
      	</label>
   	 </div>
   	 </c:forEach>

			<select class="skill-level" name="powerliftingSkill" id="powerliftingSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
		</div>

		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="crossfit" value="${activity }">
    	  <label class="form-check-label" for="crossfit">
      	  Powerlifting
      	</label>
   	 </div>

			<select class="skill-level" name="crossfitSkill" id="crossfitSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
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
	
		<select class="skill-level" name="dancingSkill" id="dancingSkill">
	    <option value="">--Please choose a skill level--</option>
	    <option value="1">Beginner</option>
	    <option value="2">Intermediate</option>
	    <option value="3">Advanced</option>
		</select>
		</div>
 
 		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="swimming">
    	  <label class="form-check-label" for="swimming">
      	  Swimming
      	</label>
   	 </div>

			<select class="skill-level" name="swimmingSkill" id="swimmingSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
		</div>

		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="running">
    	  <label class="form-check-label" for="running">
      	  Running
      	</label>
   	 </div>

			<select class="skill-level" name="runningSkill" id="runningSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
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
	
		<select class="skill-level" name="cardioSkill" id="cardioSkill">
	    <option value="">--Please choose a skill level--</option>
	    <option value="1">Beginner</option>
	    <option value="2">Intermediate</option>
	    <option value="3">Advanced</option>
		</select>
		</div>
 
 		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="calisthenics">
    	  <label class="form-check-label" for="calisthenics">
      	  Powerlifting
      	</label>
   	 </div>

			<select class="skill-level" name="calisthenicsSkill" id="calisthenicsSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
		</div>

		<div class="col">
 		<div class="form-group">
	    <div class="form-check">
  	    <input class="form-check-input" type="checkbox" id="yoga">
    	  <label class="form-check-label" for="yoga">
      	  Powerlifting
      	</label>
   	 </div>

			<select class="skill-level" name="yogaSkill" id="yogaSkill">
		    <option value="">--Please choose a skill level--</option>
		    <option value="1">Beginner</option>
		    <option value="2">Intermediate</option>
		    <option value="3">Advanced</option>
			</select>
		</div>
		</div>
		
	</div>	
	
	<input type="submit" value="Submit" class="btn btn-primary">
	</form>
	</div>
	



</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>