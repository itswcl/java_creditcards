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
<body>

	<div class="container">

		<h1>
			<c:out value="${ card.title }" />
		</h1>

		<div class="row d-flex">

			<div class="col-3 d-flex flex-column justify-content-center">
				<img src="<c:out value="${ card.image }"/>" alt="" width="300"
					height="200" />
			</div>

			<div class="col-7">
				<table class="table">
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
						* <c:out value="${ benefit }" />
					</p>
				</c:forEach>
			</div>

			<nav
				class="col-3 d-flex flex-column justify-content-center min-vh-100 position-fixed"
				style="right: 0px">

				<ul class="list-inline text-center">
					<li class="list-inline-item list-group py-3"><a href="/creditcards">All</a></li>
					<li class="list-inline-item list-group py-3"><a href="#">Chase</a></li>
					<li class="list-inline-item list-group py-3"><a href="#">Amex</a></li>
					<li class="list-inline-item list-group py-3"><a href="#">Citi</a></li>
				</ul>

			</nav>

		</div>

	</div>

</body>
</html>