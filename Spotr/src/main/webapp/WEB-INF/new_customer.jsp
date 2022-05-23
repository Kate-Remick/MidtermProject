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
<link rel="stylesheet" href="../css/new_customer.css">

</head>
<body>

<main class="container-fluid">

		<div class="container-fluid">
		<section class="header" id="header">
			<div class="banner" id="banner">
			<a href="/"><img src="images/spotr_logo.png"
				class="logo" id="logo" /></a>
				
			<span class="tagline" id="tagline">Local Fitness Finder</span>
			<span class="button" id="login"><a href="customer.do">Customer</a></span>
			<span class="button" id="new_account"><a href="facility.do">Facility</a></span>
			</div>
		</section>
		</div>
		
<h1>${DEBUG}</h1>
</br>
</br>
</br>

	<div name="inputs" id="inputs" class="col-sm-6 offset-3">
	<form action="newUser.do" method="POST" name="new_customer_form" class="new_customer_form" id="new_customer_form">
  <div class="form-group">
	
	<div class="row d-inline-flex">
	<div class="col"></div><label for="disabledUsername"><strong>Username:</strong></label></div>
	<div class="col"><input disabled type="text" id="disabledUsername" class="form-control" placeholder="username goes here"></div>	
	</div></br>
	<div class="row">
	<label for="firstname"><strong>First Name:</strong></label>
	<input type="text" name="firstname" id="firstname" class="form-control" placeholder="First Name">
	</div></br>
	<div class="row">
	<label for="lastname"><strong>Last Name:</strong></label>
	<input type="text" name="lastname" id="lastname">
	</div><br>
	<div class="row mb-3">
	<label for="birth_date"><strong>Date of Birth:</strong></label>
	<input type="date" name="birth_date" id="birth_date">
	</div><br>
	<div class="mb-3">
	<label for="gender"><strong>Gender:</strong></label>
	<select name="gender" id="gender">
    <option value="">--Please choose an option--</option>
    <option value="1">Male</option>
    <option value="2">Female</option>
    <option value="3">Something Else/Choose Not to Say</option>
	</select>
	</div></br>
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
	
 	<div class="form-group row">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="weightlifting">
        <label class="form-check-label" for="weightlifting">
          Weightlifting
        </label>
      </div>
	
	<div class="form-check">
  <input class="form-check-input" type="checkbox" value="weightlifting" id="weightlifting">
  <label class="form-check-label" for="weightlifting">
    Default checkbox
  </label>
</div>
	
	
	
	
	
			<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="weightliftingDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  				Skill Level
 			</button>
			  <div class="dropdown-menu" aria-labelledby="weightliftingDropdown">
		    <a class="dropdown-item" value="Beginner">Beginner</a>
		    <a class="dropdown-item" value="Intermediate">Intermediate</a>
		    <a class="dropdown-item" value="Advanced">Advanced</a>
		  </div>
		  </div>
		</div>
		
		
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="powerlifting">
      <label class="form-check-label" for="powerlifting">
        Powerlifting
      </label>
    </div>
		<div class="dropdown">
 			<button class="btn btn-secondary dropdown-toggle" type="button" id="powerliftingDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  				Skill Level
 			</button>
			  <div class="dropdown-menu" aria-labelledby="powerliftingDropdown">
		    <a class="dropdown-item" value="Beginner">Beginner</a>
		    <a class="dropdown-item" value="Intermediate">Intermediate</a>
		    <a class="dropdown-item" value="Advanced">Advanced</a>
		 		</div>
		</div>
  </div>
  
  
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="crossfit">
      <label class="form-check-label" for="crossfit">
        Crossfit
      </label>
    </div>
		<div class="dropdown">
 			<button class="btn btn-secondary dropdown-toggle" type="button" id="crossfitDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  				Skill Level
 			</button>
			  <div class="dropdown-menu" aria-labelledby="crossfitDropdown">
		    <a class="dropdown-item" value="Beginner">Beginner</a>
		    <a class="dropdown-item" value="Intermediate">Intermediate</a>
		    <a class="dropdown-item" value="Advanced">Advanced</a>
		  </div>
		</div>
  </div>
  </br>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="dancing" id="dancing">
      <label class="form-check-label" for="dancing">
        Dancing
      </label>
    </div>
		<div class="dropdown">
 			<button class="btn btn-secondary dropdown-toggle" type="button" id="dancingDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  				Skill Level
 			</button>
		  <div class="dropdown-menu" aria-labelledby="dancingDropdown">
		    <a class="dropdown-item" value="Beginner">Beginner</a>
		    <a class="dropdown-item" value="Intermediate">Intermediate</a>
		    <a class="dropdown-item" value="Advanced">Advanced</a>
		  </div>
		</div>			
  </div>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="swimming" id="swimming">
      <label class="form-check-label" for="swimming">
        Dancing
      </label>
    </div>
 			<div class="dropdown">
  			<button class="btn btn-secondary dropdown-toggle" type="button" id="swimmingDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   				Skill Level
  			</button>
 			  <div class="dropdown-menu" aria-labelledby="swimmingDropdown">
			    <a class="dropdown-item" value="Beginner">Beginner</a>
			    <a class="dropdown-item" value="Intermediate">Intermediate</a>
			    <a class="dropdown-item" value="Advanced">Advanced</a>
			  </div>
			</div>			
  </div>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="running" id="running">
      <label class="form-check-label" for="running">
        Running
      </label>
    </div>
 			<div class="dropdown">
  			<button class="btn btn-secondary dropdown-toggle" type="button" id="runningDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   				Skill Level
  			</button>
 			  <div class="dropdown-menu" aria-labelledby="runningDropdown">
			    <a class="dropdown-item" value="Beginner">Beginner</a>
			    <a class="dropdown-item" value="Intermediate">Intermediate</a>
			    <a class="dropdown-item" value="Advanced">Advanced</a>
			  </div>
			</div>			
  </div>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="cardio" id="cardio">
      <label class="form-check-label" for="cardio">
        Cardio
      </label>
    </div>
		<div class="dropdown">
 			<button class="btn btn-secondary dropdown-toggle" type="button" id="cardioDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  				Skill Level
 			</button>
			  <div class="dropdown-menu" aria-labelledby="cardioDropdown">
		    <a class="dropdown-item" value="Beginner">Beginner</a>
		    <a class="dropdown-item" value="Intermediate">Intermediate</a>
		    <a class="dropdown-item" value="Advanced">Advanced</a>
		  </div>
		</div>			
  </div>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="calisthenics" id="calisthenics">
      <label class="form-check-label" for="calisthenics">
        Calisthenics
      </label>
    </div>
		<div class="dropdown">
  			<button class="btn btn-secondary dropdown-toggle" type="button" id="calisthenicsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   				Skill Level
  			</button>
 			  <ul class="dropdown-menu" aria-labelledby="calisthenicsDropdown">
			    <li><a class="dropdown-item" value="Beginner">Beginner</a></li>
			    <li><a class="dropdown-item" value="Intermediate">Intermediate</a></li>
			    <li><a class="dropdown-item" value="Advanced">Advanced</a></li>
		    </ul>
		</div>			
  </div>
 	<div class="form-group row">
    <div class="form-check">
      <input class="form-check-input" type="yoga" id="yoga">
      <label class="form-check-label" for="yoga">
        Yoga
      </label>
    </div>
		<div class="dropdown">
  			<button class="btn btn-secondary dropdown-toggle" type="button" id="yogaDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   				Skill Level
  			</button>
 			  <div class="dropdown-menu" aria-labelledby="yogaDropdown">
			    <a class="dropdown-item" value="Beginner">Beginner</a>
			    <a class="dropdown-item" value="Intermediate">Intermediate</a>
			    <a class="dropdown-item" value="Advanced">Advanced</a>
			  </div>
			</div>			
    </div>
	
	
	<input type="submit" value="Submit" class="btn btn-primary">
	</div>
	</form>
	</div>
	



</main>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>