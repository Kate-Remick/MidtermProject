<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Journal Entry</title>
</head>
<body>
<h2>Add A New Journal Entry</h2>
<form action="addJournal.do" method="POST">
<p><label for="entry">Entry</label> <input type="text" name="entry"
	id="entry">
</p>
<br>
<h4>Goal Accomplished</h4>
<p>
	<input id="accomplished" type="checkbox" name="accomplished" value="${true}">
	<label for="accomplished">Did you achieve your goal?</label>
	
	<select name="goalId">
		
	<c:forEach var="goal" items="${customer.goals}">
	<option value="${goal.id}">${goal.name}</option>
	</c:forEach>
	</select>
	</p>
	<br>
	<button type="submit">Add new Entry</button>
</form>
</body>
</html>