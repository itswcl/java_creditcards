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
<title>Credit Card Churning</title>
</head>
<body class="bg-dark">


	<div class="container">

		<h1 class="text-light text-center">WCL</h1>

		<div class="row d-flex">

			<div class="row row-cols-2 row-cols-md-3 g-3"
				style="padding-right: 200px">
				<c:forEach var="card" items="${ cards }">

					<div class="col d-flex flex-column justify-content-around">

						<a href="/creditcards/<c:out value="${ card.id }" />"> <img
							src="<c:out value="${ card.image }"/>"
							alt="<c:out value="${ card.title }" />" class="card-img-top" /></a>
						<div class="card-body text-light h-100 d-inline-block">
							<h5 class="card-title fs-6">
								<c:out value="${ card.title }" />
							</h5>
							<p class="card-text fs-6">
								Annual Fee
								<c:out value="${ card.fee }" />
							</p>

						</div>
						<div class="card-body rounded-pill bg-warning text-center">
							<c:if test="${ card.actual_cost > 0 }">
								<h3 class="fs-5">
									Annual Earn $
									<c:out value="${ card.actual_cost }" />
								</h3>
							</c:if>
							<c:if test="${ card.actual_cost == 0 }">
								<h3 class="fs-5">
									Actual Fee $
									<c:out value="${ card.actual_cost }" />
								</h3>
							</c:if>
							<c:if test="${ card.actual_cost < 0 }">
								<h3 class="fs-5">
									Actual Fee $
									<c:out value="${ card.actual_cost }" />
								</h3>
							</c:if>
						</div>

					</div>

				</c:forEach>

			</div>

			<nav
				class="col-3 d-flex flex-column justify-content-center min-vh-100 position-fixed"
				style="right: 0px">

				<ul class="list-inline text-center fs-1">

					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards">All</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/chase">Chase</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/amex">Amex</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards/bank/citi">Citi</a></li>
					<li class="list-inline-item list-group py-3"><a
						class="text-warning" href="/creditcards">Other</a></li>
					<c:if test="${ user_id == 1 }">
						<li class="list-inline-item list-group py-3"><a
							class="text-warning" href="#">Add</a></li>
					</c:if>
				</ul>

			</nav>

		</div>

	</div>

</body>
</html>