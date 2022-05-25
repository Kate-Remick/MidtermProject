<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Let's set a new goal!</h3>
	<fieldset>
		<form action="addGoal.do" method="post">

			<div class="goal">
				<label for="name">What do you want to achieve? </label><input
					type="text" name="name" /><br> <label for="description">How
					do you plan to achieve your goal, and what motivates you? </label><input
					type="text" name="description" />
			</div>
			<button type="submit">Set New Goal</button>

		</form>
	</fieldset>

</body>
</html>