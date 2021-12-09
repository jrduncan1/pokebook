<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>View Expense</title>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center col-6">
			<h1>Expense Details</h1>
			<a href="/"><button class="btn btn-warning">Dashboard</button></a>
		</div>
		<div class="mt-5 col-4">
			<table class="table table-borderless">
				<tr>
					<td>Expense Name:</td>
					<td>${expense.expenseName}</td>
				</tr>
				<tr>
					<td>Expense Description:</td>
					<td>${expense.description}</td>
				</tr>
				<tr>
					<td>Vendor:</td>
					<td>${expense.vendor}</td>
				</tr>
				<tr>
					<td>Expense Name:</td>
					<td><fmt:formatNumber value="${expense.amount}" type="currency" /></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>