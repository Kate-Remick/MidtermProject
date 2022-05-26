<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Page</title>

<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="css/updateFacility.css">
<link rel="stylesheet" href="css/template.css">

</head>


<body>

	<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>
		
		<br> <br> <br>
		<div class="col-sm-4 offset-4">
			<form action="create.do" method="post" class="form form-alignment">
				 <br>  <span class="label"> 
					 <div class="row field-body">
					<div class="col">
				 <label for="username">Enter your user name:</label>
				 </div>
				 </div>
				</span><input type="text" class="form-control" name="username"
					id="username" /><br> 
					<div class="row field-body">
					<div class="col">
					<label for="password">Enter your password:</label>
					</div>
					</div>
					<input type="password" class="form-control"
					name="password" id="password" /><br> <span class="label"><label
					for="userType">What user type are you:</label></span> <select
					name="roleId" id="userType">
					<option value="1">New Customer</option>
					<option value="2">New Facility</option>
				</select> <br> <br>
				<button type="submit" class="btn btn-primary col-sm-6 offset-3">Create New User</button>

			</form>
		</div>

	</main>

</body>
</html>