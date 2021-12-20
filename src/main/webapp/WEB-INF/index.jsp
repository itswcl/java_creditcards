<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

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
		<!-- SHOW DATA WITH EDIT ROUTE / DELETE FORM-->
				<table class="table">
			<thead>
				<tr>
					<th>title head</th>
					<th>title head</th>
					<th>title head</th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:forEach var="item_name" items="${ items }">
					<tr>
						<td>
							<a href="/languages/${ item_name.memberAttr }">
							<c:outvalue="${ item_name.memberAttr }" />
							</a>
						</td>
						<td><c:out value="${ item_name.memberAttr }" /></td>
						<td>
							<a class="btn" href="/items/${ item_name.id }/edit">Edit</a>
							<form action="/items/${ item_name.id }" method="post">
								<input type="hidden" name="_method" value="delete">
								<input class="btn"type="submit" value="Delete">
							</form>
						</td>
							
					</tr>
				</c:forEach> --%>
			</tbody>
		</table>

	</div>
	
</body>
</html>