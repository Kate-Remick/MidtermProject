<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New User Page</title>
</head>
<body>
<h3>Creating a new user</h3>
<form action="create.do" method = "post">
<input type="text" !important hidden name="active" id="active" value="1"/>
<label for="username">Enter your user name:</label><input type="text" name="username" id="username"/></br>
<label for="password">Enter your password:</label><input type="password" name="password" id="password"/></br>
<label for="userType">What user type are you:</label>
<select name="roleId" id="userType">
<option value="1">New Customer</option>
<option value="2">New Facility</option>
</select>
<button type="submit">Create New User</button>

</form>



</body>
</html>