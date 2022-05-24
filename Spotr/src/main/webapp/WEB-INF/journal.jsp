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
		<c:if test="${! empty customer.goals }">
		<c:forEach var="goal" items="${customer.goals}">
				<c:if test="${!goal.completed }">
					<li>${goal.name }
						<ul>
							<li>${goal.description }</li>
							<li><a href="completeGoal.do?goalId=${goal.id}"><button>Goal
										Completed</button></a></li>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</c:if>
	</ul>
	<h3>Completed Goals</h3>
	<ul>
		<c:if test="${! empty customer.goals }">
		<c:forEach var="goal" items="${customer.goals}">
				<c:if test="${goal.completed }">
					<li>${goal.name }
						<ul>
							<li>${goal.description }</li>
							<li><a href="completeGoal.do?goalId=${goal.id}"><button>Goal
										Completed</button></a></li>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</c:if>
	</ul>
	<div class="journalEntry">
		<br>
		<c:if test="${! empty recentEntry }">
			<h5>Date: ${recentEntry.createdAt}</h5>
			<h5>Goal: ${recentEntry.goal.getName()}, completed?
				${recentEntry.goal.isCompleted()}</h5>
			<p>${recentEntry.entry}</p>
			<a href="removeJournal.do?journalId=${entry.id}"><button>Delete
					Entry</button></a>
			<br>
		</c:if>
		<c:if test="${! empty customer.logs }">
			<c:forEach var="entry" items="${customer.logs}">
				<div class="journalEntry">
					<br>
					<h5>Date: ${entry.createdAt}</h5>
					<h5>Goal: ${entry.goal.getName()}, completed?
						${entry.goal.isCompleted()}</h5>
					<p>${entry.entry}</p>
					<a href="removeJournal.do?journalId=${entry.id}"><button>Delete
							Entry</button></a> <br>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<a href="addGoal.do"><button>Add new goal</button></a>
</body>
</html>