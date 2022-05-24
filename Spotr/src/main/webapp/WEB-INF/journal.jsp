<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Your Journal:</h3>
	<h6>${removed }</h6>

	<a href="addJournal.do"><button>Create New Journal Entry</button></a>
	<h3>Current Goals:</h3>
	<ul>
		<c:forEach var="goal" items="${customer.goals}">
			<li>${goal.name }
				<ul>
					<li>${goal.description }</li>
					<li><a href="removeGoal.do?goal=${goal}"><button>Delete</button></a></li>
				</ul>
			</li>
		</c:forEach>
	</ul>
	<div class="journalEntry">
		<br>
		<h5>Date: ${recentEntry.createdAt}</h5>
		<h5>Goal: ${recentEntry.goal.getName()}, completed?
			${recentEntry.goal.isCompleted()}</h5>
		<p>${recentEntry.entry}</p>
		<a href="removeJournal.do?journal=${entry}"><button>Delete
				Entry</button></a> <br>
		<c:forEach var="entry" items="${customer.logs}">
			<div class="journalEntry">
				<br>
				<h5>Date: ${entry.createdAt}</h5>
				<h5>Goal: ${entry.goal.getName()}, completed?
					${entry.goal.isCompleted()}</h5>
				<p>${entry.entry}</p>
				<a href="removeJournal.do?journal=${entry}"><button>Delete
						Entry</button></a> <br>
			</div>
		</c:forEach>
	</div>
	<a href="addGoal.do"><button>Add new goal</button></a>
</body>
</html>