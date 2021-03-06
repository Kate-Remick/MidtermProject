<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Facility</title>

<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="css/updateFacility.css">
<link rel="stylesheet" href="css/template.css">

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

				<div class="legend col-sm-4 offset-4">New Facility Information:</div>
				<form action="createFacility.do" method="POST" name="createFacility"
					class="createFacility col-sm-6 offset-3" id="createFacility">
					<div class="form-alignment">

						<div class="row d-inline-flex">
							<span class="label"><label for="name"><strong>Name
										of facility:</strong></label></span> <input type="text" name="name" id="name"
								class="form-control" placeholder="Facility Name">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="missionStatement"><strong>Mission
										statement:</strong></label></span> <input type="text" name="missionStatement"
								id="missionStatement" class="form-control"
								placeholder="Description">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="brand"><strong>Brand
										of facility:</strong></label></span> <input type="text" name="brand" id="brand"
								class="form-control" placeholder="Brand">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="ownerName"><strong>Owner
										of facility:</strong></label></span> <input type="text" name="ownerName"
								id="ownerName" class="form-control" placeholder="Owner Name">
						</div>

						<br> <br> <br>

						<div class="row d-inline-flex">
							<span class="label"> <label class="form-check-label"
								for="hasTrainers"> Has Personal Trainers: </label>
							</span> <input value="${true}" class="form-check-input form-control"
								name="hasTrainers" type="checkbox" id="hasTrainers">
						</div>

						<div class="row d-inline-flex">
							<span class="label"> <label class="form-check-label"
								for=alwaysOpen> Open All Hours: </label>
							</span> <input value="${true}" class="form-check-input"
								name="alwaysOpen" type="checkbox" id="alwaysOpen">
						</div>

						<div class="row d-inline-flex">
							<span class="label"> <label for="price"><strong>Price
										($) :</strong></label>
							</span> <input type="number" name="price" id="price"
								class="form-control" value="50">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="address1"><strong>Street
										Address 1:</strong></label></span> <input type="text" name="streetAddress1"
								id="address1" class="form-control" placeholder="100 D Street">
						</div>
						<br>
						<div class="row d-inline-flex">
							<span class="label"><label for="address2"><strong>Street
										Address 2:</strong></label></span> <input type="text" name="streetAddress2"
								id="address2" class="form-control" placeholder="Unit 104">
						</div>
						<br>
						<div class="row d-inline-flex">
							<div>
								<span class="label"><label for="city"><strong>City:</strong></label></span>
								<input type="text" name="city" id="city" class="form-control"
									placeholder="Denver">
							</div>
							<br> <br>
							<div>
								<span class="label"><label for="state"><strong>State:</strong></label></span>
								<select class="form-control" name="state" id="state">
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
							<br> <br>
							<div>

								<span class="warning">* Required Field *</span> <span
									class="label"><label for="zip"><strong>Zip
											Code:</strong></label></span> <input type="number" name="zip" id="zip"
									class="form-control" placeholder="80002"><br>
							</div>
							<br>
						</div>

						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="phone"><strong>Phone
										number:</strong></label></span> <input type="tel" name="phone" id="phone"
								class="form-control" placeholder="867-5309">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="email"><strong>Email:</strong></label></span>
							<input type="email" name="email" class="form-control" id="email"
								placeholder="bobloblaw@lawblog.com">
						</div>
						<br>

						<div class="row d-inline-flex">
							<span class="label"><label for="url"><strong>Website
										Link:</strong></label></span> <input type="url" name="url" class="form-control"
								id="url"
								placeholder="https://www.youtube.com/watch?v=dQw4w9WgXcQ">
						</div>
						<br>

						<p>
							<strong>Facility Activities</strong>
						</p>

						<c:forEach var="activity" items="${activities}">

							<div class="row  d-inline-flex">
								<div class="col">
									<div class="form-group">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												name="activityarray" class="form-control"
												value="${activity.id}"> <label
												class="form-check-label" for="activityarray">${activity.name }
											</label>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>

						<br> <input type="submit" value="Create new Facility"
							class="btn btn-primary">

					</div>
				</form>
			</fieldset>
			<br>

		</div>
	</main>
</body>

</html>