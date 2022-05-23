<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Creating a new user</h3>
<form action="create.do" method = "post">
<label for="username">Enter new user name:</label><input type="text" name="username" id="username"/>
<label for="password">Enter new user name:</label><input type="text" name="password" id="password"/>
<label for="userType">What would you like to create</label>
<select name="roleId" id="userType">
<option value="1">New customer</option>
<option value="2">New Facility</option>
</select>
<button type="submit"> Create new User</button>

</form>



</body>
</html>