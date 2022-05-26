<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Journal Entry</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="../css/journal.css">

</head>
<body>
	<div>
		<jsp:include page="banner.jsp"></jsp:include>
	</div>

	<div class="container-fluid">
		<h3 class="tagline1">New Journal Entry</h3>

		<fieldset class="col-sm-8 offset-2">

			<form action="addJournal.do" method="POST" id="addJournal">


				<div class="row" style="height: 300px, padding: 20px">
					<div class="col-sm-1 "></div>
					<div class="col-sm-8 ">
						<div class="row">
							<br>
							<br>
						</div>
						<span><label for="entry"></label> 
						<textarea style="border-radius: 10"rows="8" cols="45" wrap="hard" name="entry" form="addJournal" placeholder="My Journal Entry..." ></textarea>
						
						<!-- <input class="textbox"
							type="text" name="entry" placeholder="My Journal Entry..."> -->
						</span>
						<div class="row">
							<br>
							<br>
						</div>
					</div>
					<div class="col-sm-3">

						<div class="row" style="height: 20%">
						</div>
						<div class="row" style="height: 20%">

							<span>In pursuit of goal: <select name="goalId">
									<c:forEach var="goal" items="${incompleteGoals}">
										<c:if test="${!goal.completed }">
											<option value="${goal.id}">${goal.name}</option>
										</c:if>
									</c:forEach>
							</select></span>

						</div>
						<div class="row" style="height: 20%">
							<span><input type="checkbox" name="accomplished"
								value="${true}"><label for="accomplished">
									Accomplished!</label></span>

						</div>
						<div class="row" style="height: 20%">
							<br> <span><button class="btn btn-primary"
									type="submit">Add new Entry</button></span>

						</div>




					</div>
				</div>



			</form>
		</fieldset>

	</div>
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>