<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Page</title>

<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="../css/updateFacility.css">
<link rel="stylesheet" href="../css/template.css">

</head>


<body>

	<main class="container-fluid">

		<div class="container-fluid">
			<section class="header" id="header">
				<div class="banner" id="banner">
					<a href="/"><img src="images/spotr_logo.png" class="logo"
						id="logo" /></a> <span class="tagline" id="tagline">Local
						Fitness Finder</span>
					<div class="logout">
						<span class="button" id="logout"><a href="logout.do"
							id="logout_link">Logout</a></span>
					</div>
				</div>
			</section>
		</div>
		<br> <br> <br>
		<div class="col-sm-6 offset-3">
			<form action="create.do" method="post" class="form-control">
				 <br> <input type="text" !important hidden
					name="active" id="active" value="1" /> <span class="label">
					<label for="username">Enter your user name:</label>
				</span><input type="text" class="form-control" name="username"
					id="username" /><br> <label for="password">Enter your
					password:</label><input type="password" class="form-control"
					name="password" id="password" /><br> <span class="label"><label
					for="userType">What user type are you:</label></span> <select
					name="roleId" id="userType">
					<option value="1">New Customer</option>
					<option value="2">New Facility</option>
				</select> <br> <br>
				<button type="submit" class="form-control">Create New User</button>

			</form>
		</div>

	</main>

</body>
</html>