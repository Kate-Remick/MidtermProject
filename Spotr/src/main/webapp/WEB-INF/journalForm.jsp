<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Journal Entry</title>
</head>
<body>
	<h2>New Journal Entry</h2>
	<form action="addJournal.do" method="POST">
		<p>
			<label for="entry">Entry</label> <input type="text" name="entry"
				id="entry">
		</p>
		<br>
		<br>
		<c:if test="${! empty incompleteGoals}">
			<div class="Journal Entry">
				<div id="goalDrop">
				<h4>I pursuit of goal:</h4>
					<select name="goalId">
						<c:forEach var="goal" items="${incompleteGoals}">
							<c:if test="${!goal.completed }">
								<option value="${goal.id}">${goal.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<br>
				<input id="accomplished" type="checkbox" name="accomplished"
					value="${true}"> <label for="accomplished">Goal Accomplished!</label>
			</div>
		</c:if>
		<br>
		<button type="submit">Add new Entry</button>
	</form>
</body>
</html>