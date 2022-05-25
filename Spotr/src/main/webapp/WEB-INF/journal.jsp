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
	<c:if test="${hasIncompleteGoals }">
		<a href="addJournal.do"><button>Create New Journal Entry</button></a>
	</c:if>
	<a href="addGoal.do"><button>Add new goal</button></a>
	<div class ="goals current">
	<h3>Current Goals:</h3>
	<ul>
		<c:if test="${! empty customer.goals }">
			<c:forEach var="goal" items="${customer.goals}">
				<c:if test="${!goal.completed }">
					<li>${goal.name }
						<ul>
							<li>${goal.description }</li>
							<li><a href="completeGoal.do?goalId=${goal.id}"><button>Goal
										Complete</button></a></li>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</c:if>
	</ul>
	</div>
	<div class="goals completed">
		<h3>Completed Goals</h3>
		<ul>
			<c:if test="${! empty customer.goals }">
				<c:forEach var="goal" items="${customer.goals}">
					<c:if test="${goal.completed }">
						<li>${goal.name }
							<ul>
								<li>${goal.description }</li>
							</ul>
						</li>
					</c:if>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<br>
		<div class="journalEntries">
			<c:if test="${! empty customer.logs }">
				<c:forEach var="entry" items="${customer.logs}">
					<div class="journalEntry">
						<br>
						<h5>Date: ${entry.createdAt}</h5>
						<h5>Goal: ${entry.goal.getName()}</h5> 
						<c:if test="${entry.goal.isCompleted()}">
						<h5>Goal met!</h5>
						</c:if>
						<p>${entry.entry}</p>
						<a href="removeJournal.do?journalId=${entry.id}"><button>Delete
								Entry</button></a> <br>
					</div>
				</c:forEach>
			</c:if>
		</div>
</body>
</html>