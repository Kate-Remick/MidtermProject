<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Journal</title>

<jsp:include page="bootstrapHead.jsp"></jsp:include>

<link rel="stylesheet" href="../css/journal.css">

</head>
<body>
	<main>
		<div class="container-fluid">
			<h3 class="tagline">Your Fitness Journal</h3>
			<fieldset class="col-sm-8 offset-2">
				<br>
				<div class="row buttons">
					<c:if test="${hasIncompleteGoals }">
						<a href="addJournal.do"><button
								class="btn btn-primary btn-left">Create New Journal
								Entry</button></a>
					</c:if>
					<a href="addGoal.do"><button class="btn btn-primary btn-right">Add
							new goal</button></a> 
				</div>

					<br>


				<div class="col">




					<h3 class="legend">Current Goals:</h3>
					<c:if test="${! empty customer.goals }">
						<c:forEach var="goal" items="${customer.goals}">

							<c:if test="${!goal.completed }">
								<div class="row journal">
									<span class="goal-info" id="goal-name">${goal.name }</span> <span
										class="goal-info" id="goal-description">${goal.description}</span>
									<span class="goal-info" id="complete"><a
										href="completeGoal.do?goalId=${goal.id}"><button class="btn btn-primary">Accomplished</button></a></span><br>
								</div>
								<br>
							</c:if>
						</c:forEach>
					</c:if>
					<br> <br>


					<h3 class="legend">Journal Entries</h3>
					<div class="journal-entries">
						<c:if test="${! empty customer.logs }">
							<c:forEach var="entry" items="${customer.logs}">
								<div class="journal row">
									<span class="goal-info" id="date">Date:
										${entry.createdAt.getYear()}, ${entry.createdAt.getMonth()},
										${entry.createdAt.getDayOfMonth()}</span> <span class="goal-info"
										id="journal-goal">Goal: ${entry.goal.getName()}</span> <span
										class="goal-info" id="journal-complete"><c:if
											test="${entry.goal.isCompleted()}">
											<h5>Goal met!</h5>
										</c:if></span> <span class="goal-info" id="delete"><a
										href="removeJournal.do?journalId=${entry.id}"><button class="btn btn-primary btn-right">Delete</button></a></span>
								</div>
								<div class="journal row">
									<span id="journal-text">${entry.entry} </span>
								</div>
								<br>
							</c:forEach>
						</c:if>
					</div>
					<br> <br>


					<h3 class="legend">Completed Goals:</h3>
					<c:if test="${! empty customer.goals }">
						<c:forEach var="goal" items="${customer.goals}">

							<c:if test="${goal.completed }">
								<div class="row journal">
									<span class="goal-info" id="gcn">${goal.name }</span> <span
										class="goal-info" id="gcd">${goal.description}</span><br>

								</div>
								<br>
							</c:if>
						</c:forEach>
					</c:if>



				</div>
				
				
			</fieldset>
		</div>
	</main>
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>