<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- Bootstrap JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>WCL</title>
</head>
<body class="bg-dark">

	<div class="container">

		<h1 class="text-light">
			<c:out value="${ card.title }" />
			<c:if test="${ user_id == 1 }">
				<p><a
					class="text-light" href="/creditcards/${ card.id }/edit">Edit</a></p>
			</c:if>
		</h1>

		<div class="row d-flex text-light">

			<div class="col-3 d-flex flex-column justify-content-center">
				<img src="<c:out value="${ card.image }"/>" alt="" width="300"
					height="200" />
			</div>

			<div class="col-7">
				<table class="table text-light">
					<tbody>
						<tr>
							<td>Bank</td>
							<td><c:out value="${ card.bank }" /></td>
						</tr>
						<tr>
							<td>Fee</td>
							<td><c:out value="${ card.fee }" /></td>
						</tr>
						<tr>
							<td>Actual Cost</td>
							<c:if test="${ card.actual_cost > 0}">
								<td>Earn $<c:out value="${ card.actual_cost }" /></td>
							</c:if>

							<c:if test="${ card.actual_cost == 0}">
								<td>$<c:out value="${ card.actual_cost }" /></td>
							</c:if>

							<c:if test="${ card.actual_cost < 0}">
								<td>Pay $<c:out value="${ card.actual_cost }" /></td>
							</c:if>
						</tr>
						<tr>
							<td>Bonus</td>
							<td><c:out value="${ card.bonus }" /></td>
						</tr>

					</tbody>
				</table>
				<h5>Benefits</h5>
				<c:forEach var="benefit" items="${ benefits }">
					<p class="fs-6">
						*
						<c:out value="${ benefit }" />
					</p>
				</c:forEach>
			</div>

			<nav
				class="col-3 d-flex flex-column justify-content-center min-vh-100 position-fixed"
				style="right: 0px">

				<ul class="list-inline text-center fs-1">
					<c:if test="${ user_id == 1 }">
						<li class="list-inline-item list-group py-3"><a
							class="text-warning" href="/creditcards/logout">Logout</a></li>

					</c:if>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards">All</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/chase">Chase</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/amex">Amex</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/citi">Citi</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/other">Other</a></li>
<%-- 					<c:if test="${ user_id == 1 }">
						<li class="list-inline-item list-group py-3"><a
							class="text-warning" href="#">Add</a></li>
					</c:if> --%>
				</ul>

			</nav>

		</div>

	</div>

</body>
</html>