<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ADD BOOTSTRAP INTO THE PROJECT -->
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<!-- ADD CSS FILES INTO THE PROJECT -->
<link rel="stylesheet" href="css/updateFacility.css">
<link rel="stylesheet" href="css/template.css">
<link rel="stylesheet" href="css/goalForm.css">

</head>


<body>

	<main class="container-fluid">

		<div class="banner-insert">
			<jsp:include page="banner.jsp"></jsp:include>
		</div>
		
		<br>
		<br>
		<div class="row col-sm-6 offset-3">
		<form class="field-solid" action="addGoal.do" method="post">
			<div class="form-alignment">

				<div class="row d-inline-flex">
					<label  for="name">What do you want to achieve? </label><input
						type="text" class="form-control" name="name" /><br> <br>
					<br>
					<label for="description">How do you plan to achieve your
						goal, and what motivates you? </label><input type="text"
						class="form-control" name="description" /><br><br>
				</div><br><br>
				<button class="btn btn-primary col-sm-3 offset-4" type="submit">Set New
					Goal</button>
			</div>
		</form>
		</div>
	</main>
</body>
</html>