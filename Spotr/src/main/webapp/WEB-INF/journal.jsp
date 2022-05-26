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
	<div>
		<jsp:include page="banner.jsp"></jsp:include>
	</div>
	<main>
		<div class="container-fluid">
			<h3 class="tagline1">Your Fitness Journal</h3>
			<div class="fieldset1 col-sm-8 offset-2">
				<br>


				<%-- <div class="row buttons">
					<c:if test="${hasIncompleteGoals }">
						<a href="addJournal.do"><button
								class="btn btn-primary btn-left">Create New Journal
								Entry</button></a>
					</c:if>
					<a href="addGoal.do"><button class="btn btn-primary btn-right">Add
							new goal</button></a>
				</div> --%>


				<div class="row">
					<div class="col-sm-4">
						<c:if test="${hasIncompleteGoals }">
							<a href="addJournal.do"><button class="btn btn-primary ">Create
									New Journal Entry</button></a>
						</c:if>
					</div>
					<div class="col-sm-6"></div>
					<div class="col-sm-2">
						<a href="addGoal.do"><button class="btn btn-primary ">Set
								New Goal</button></a>
					</div>
				</div>

				<br>


				<div class="col">



					<div class="row">
						<h3 class="legend1">Current Goals:</h3>
					</div>
					<c:if test="${! empty customer.goals }">
						<c:forEach var="goal" items="${customer.goals}">

							<c:if test="${!goal.completed }">

								<div class="row journal ">
									<div class="row" style="height: 20%"> </div>
									<div class="row" style="height: 60%">
										<div class="col-sm-2">${goal.name }</div>
										<div class="col-sm-8">${goal.description}</div>
										<div class="col-sm-2">
											<a href="completeGoal.do?goalId=${goal.id}"><button
													class="btn btn-primary">Accomplished</button></a>
										</div>
										<br>
									</div>
									<div class="row" style="height: 20%"> </div>



								</div>

								<br>
							</c:if>
						</c:forEach>
					</c:if>
					<br> <br>

	<div class="row">
					<h3 class="legend1">Journal Entries</h3>
	</div>
					<div class="journal-entries">


						<c:if test="${! empty customer.logs }">
							<c:forEach var="entry" items="${customer.logs}">
								<div class="journal row">
									<div class=" row">
										<div class="col-sm-4">Date:
											${entry.createdAt.getYear()}, ${entry.createdAt.getMonth()},
											${entry.createdAt.getDayOfMonth()}</div>

										<div class="col-sm-3">Goal: ${entry.goal.getName()}</div>
										<div class="col-sm-3">
											<c:if test="${entry.goal.isCompleted()}">
												<p>Goal met!</p>
											</c:if>
										</div>

										<div class="col-sm-2">
											<div class="row" style="height: 30%"></div>
											<div class="row" style="height: 30%">
												<a href="removeJournal.do?journalId=${entry.id}"><button
														class="btn btn-primary btn-right">Delete</button></a>
											</div>
											<div class="row" style="height: 30%"></div>
										</div>


									</div>
									<div class="row">
										<span id="journal-text">${entry.entry} </span>
									</div>
								</div>
								<br>
							</c:forEach>
						</c:if>



					</div>
					<br> <br>

					<div class="row">
						<h3 class="legend1">Completed Goals:</h3>
					</div>
					<c:if test="${! empty customer.goals }">
						<c:forEach var="goal" items="${customer.goals}">

							<c:if test="${goal.completed }">
								<div class="row journal">
									<div class="row" style="height: 30%"></div>
									<div class="row" style="height: 30%">

										<span class="cell" id="gcn">${goal.name }</span> <span
											class="cell" id="gcd">${goal.description}</span><br>
									</div>

									<div class="row" style="height: 30%"></div>
								</div>
								<br>
							</c:if>
						</c:forEach>
					</c:if>



				</div>


			</div>
		</div>
	</main>
	<jsp:include page="bootstrapFoot.jsp"></jsp:include>
</body>
</html>