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
<body>

	<div class="container">

		<h1>Credit Card Churning</h1>

		<div class="row d-flex">
		
			<div class="row row-cols-2 row-cols-md-3 g-3 px-5">
				<c:forEach var="card" items="${ cards }">

					<div class="col">
						<div class="card">
							<img src="<c:out value="${ card.image }"/>"
								alt="<c:out value="${ card.title }" />" class="card-img-top"/>
							<div class="card-body">
								<h5 class="card-title fs-6">
									<c:out value="${ card.title }" />
								</h5>
								<p class="card-text fs-6">
									Annual Fee
									<c:out value="${ card.fee }" />
								</p>
								<div class="card text-center">
								<h1>Actual Cost</h1>
								<h3 class="fs-3">$<c:out value="${ card.actual_cost }"/></h3>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>

			<nav
				class="col-4 d-flex flex-column justify-content-center min-vh-100 position-fixed"
				style="right: 0px">

				<ul class="list-inline text-center">
					<li class="list-inline-item list-group"><a href="#">All</a></li>
					<li class="list-inline-item list-group"><a href="#">Chase</a></li>
					<li class="list-inline-item list-group"><a href="#">Amex</a></li>
					<li class="list-inline-item list-group"><a href="#">Citi</a></li>
				</ul>

			</nav>

		</div>

	</div>

</body>
</html>