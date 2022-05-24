<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Create a new goal</h3>
	<form action="addGoal.do" method="post">
		
		<label for="name">Give your goal a short name: </label><input
			type="text" name="name" /> <label for="description">Description:
		</label><input type="text" name="description" />
		<button type="submit">Create New Goal</button>

	</form>

</body>
</html>