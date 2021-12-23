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
<body>

	<div class="container">
		<div class="col p-5">
			<h1>Register</h1>
			
			<form:form action="/register" method="post" modelAttribute="newUser">
				<form:errors path="*" class="text-danger" />

				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
				</div>
				
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
				</div>
				
				<div class="form-group">
					<label>Confirm Password:</label>
					<form:password path="confirmPassword" class="form-control" />
				</div>
				
				<input type="submit" value="Register" class="btn btn-primary" />
			</form:form>
			
		</div>
	</div>

</body>
</html>