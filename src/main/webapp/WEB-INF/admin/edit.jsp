<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- Bootstrap JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Starting page</title>
</head>
<body class="bg-dark">



	<!-- EDIT CLASS FORM -->
	<form:form class="container form-group p-5 text-center"
		action="/creditcards/${ card.id }/edit" method="post"
		modelAttribute="card">
		<input type="hidden" name="_method" value="put">
		<form:input type="hidden" path="card_id" value="${ card.card_id }" />
		<form:input type="hidden" path="image" value="${ card.image }" />
		<form:errors path="*" />
		<div class="col-3 rounded d-block mx-auto">
			<img src="<c:out value="${ card.image }"/>" alt="" width="300"
				height="200" />
		</div>


		<div class="row d-flex text-light m-5">

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label" path="title">Title</form:label>
				<div class="col-sm-5">
					<form:input class="form-control" path="title" />
				</div>
			</div>

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label" path="bank">Bank</form:label>
				<div class="col-sm-5">
					<form:input class="form-control" path="bank" />
				</div>
			</div>

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label" path="fee">Fee</form:label>
				<div class="col-sm-5">
					<form:input class="form-control" path="fee" />
				</div>
			</div>

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label"
					path="actual_cost">Actual Cost</form:label>
				<div class="col-sm-5">
					<form:input class="form-control" path="actual_cost" />
				</div>
			</div>

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label" path="bonus">Bonus</form:label>
				<div class="col-sm-5">
					<form:input class="form-control" path="bonus" />
				</div>
			</div>

			<div class="form-group row m-2">
				<form:label class="text-light col-sm-2 col-form-label"
					path="benefits">Benefits</form:label>
				<div class="col-sm-10">

					<form:textarea class="form-control" path="benefits"
						style="height: 150px;" />
				</div>
			</div>
		</div>

		<input class="btn btn-primary bg-dark" type="submit" value="Edit" />
		<a class="btn btn-primary bg-dark" href="/creditcards">Back</a>
	</form:form>



</body>
</html>