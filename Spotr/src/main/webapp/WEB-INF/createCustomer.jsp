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
<link rel="stylesheet" href="../css/updateFacility.css">
<link rel="stylesheet" href="../css/template.css">

</head>
<body>

	<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>

		<div class="inputs" id="inputs" class="col-sm-6 offset-3">
			<div class="row col-sm-6 offset-3">
				<div class="right">
					<span class="label"><label for="disabledUsername"><strong>Username:</strong></label></span>
					<input disabled type="text" id="disabledUsername"
						class="form-control" placeholder="${loggedInUser.username}">
				</div>
			</div>
			<br> <br>
			<div class="legend col-sm-4 offset-4">New Customer Information:</div>
			<form action="createCustomer.do" method="POST"
				name="new_customer_form" class="new_customer_form col-sm-6 offset-3"
				id="new_customer_form">
				<div class="form-alignment">

					
					<div class="row d-inline-flex">
						<span class="label"><label for="firstName"><strong>First
									Name:</strong></label></span> <input type="text"  name="firstName" id="firstName"
							class="form-control" placeholder="First Name">
					</div>
					<br>
					<div class="row d-inline-flex">
						<label for="lastName"><strong>Last Name:</strong></label> <input
							type="text" class="form-control" name="lastName" id="lastName">
					</div>
					<br>
					<div class="row d-inline-flex">
						<label for="dob"><strong>Date of Birth:</strong></label> <input
							class="form-control" type="date" name="dob" id="dob">
					</div>
					<br>
					<div class="row  d-inline-flex">
						<span class="label"><label for="gender"><strong>Gender:</strong></label> </span><select
							class="form-control" name="name" id="gender">
							<option value="">--Please choose an option--</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Something Else/Choose Not to Say</option>
						</select>
					</div>
					<br>
					<div class="row  d-inline-flex">
						<label for="streetAddress1"><strong>Street
								Address 1:</strong></label> <input type="text" class="form-control" name="streetAddress1"
							id="streetAddress1"><br>
					</div>
					<br>
					<div class="row  d-inline-flex">
						<label for="streetAddress2"><strong>Street
								Address 2:</strong></label> <input type="text" class="form-control" name="streetAddress2"
							id="streetAddress2"><br>
					</div>
					<div class="row  d-inline-flex">
					<div>
						<label for="city"><strong>City:</strong></label> <input
							type="text" class="form-control" name="city" id="city"> <label for="state"><strong>State:</strong></label>
							</div>
							<br><br>
							<div>
						<select name="state" class="form-control" id="state">
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
						<br><div>
						 <label for="zip"><strong>Zip Code:</strong></label> <input
							type="text" class="form-control" name="zip" id="zip"><br>
							</div>
							<br>
					</div>

					<p>
						<strong>Choose Your Preferred Activities</strong>
					</p>

					<div class="row  d-inline-flex">
						<c:forEach var="activity" items="${activities }">

							<div class="col">
								<div class="form-group">
									<div class="form-check">
										<input class="form-check-input" class="form-control" type="checkbox"
											name="activities" value="${activity.id}"> <label
											class="form-check-label" for="activities">
											${activity.name} </label>
									</div>
								</div>

								<select class="skill-level" name="skillLevel"
									id="skillLevel">
									<option value=1>--Please choose a skill level--</option>
									<option value=1>Beginner</option>
									<option value=2>Intermediate</option>
									<option value=3>Advanced</option>
								</select>
							</div>
						</c:forEach>
					</div>
	
					<p>
						<strong>Set your fitness facility preferences:</strong>
					</p>
					
					<div id="fitnessprefs">
						<input type="checkbox" name="hasTrainers" id="hasTrainers" value="${true}"><label for="hasTrainers">Has personal trainers</label>
						<input type="checkbox" name="open247" id="open247" value="${true}"><label for="open247">Open all hours</label>
						$<input type="number" step="0.01" placeholder="0.00" min="0.00" step="1" name="maxPrice" id="maxPrice"/><label for="maxPrice">Price range maximum</label>
					</div>

	
					<p>
						<strong>Tell others about yourself and your fitness goals, if you'd like:</strong>
					</p>
					<textarea class="bio" name="bio" id="bio" placeholder="My goal is to run a marathon.  I currently run several 10k events each year."></textarea>
					<br>
					<input type="submit" class="form-control" value="Submit" class="btn btn-primary">
					</div>
			</form>
		</div>

	</main>

	<!-- ADD BOOTSTRAP INTO THE PROJECT -->
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>

</body>
</html>