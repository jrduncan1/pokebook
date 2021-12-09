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
<title>Pokebook</title>
</head>
<body>
	<div class="container m-5">
		<h1>PokeBook</h1>
		<div class="mt-4 mb-5">
			<table class="table table-light table-striped">
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
				</tr>
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td>${expense.expenseName}</td>
						<td>${expense.vendor}</td>
						<td><fmt:formatNumber value="${expense.amount}" type="currency" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="mt-3">
			<h3 class="mb-5">Track an Expense:</h3>
			<form:form action="/" method="post" modelAttribute="newExpense" class="form">
				<div class="row mb-2">
					<form:label path="expenseName" class="col-sm-2 col-form-label">Expense Name: </form:label>
					<form:errors path="expenseName" class="text-danger" />
					<div class="col-sm-4">
						<form:input path="expenseName" type="text" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:label path="vendor" class="col-sm-2 col-form-label">Vendor: </form:label>
					<form:errors path="vendor" class="text-danger" />
					<div class="col-sm-4">
						<form:input path="vendor" type="text" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:label path="amount" class="col-sm-2 col-form-label">Amount: </form:label>
					<form:errors path="amount" class="text-danger" />
					<div class="col-sm-4">
						<form:input path="amount" type="number" step="0.01" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:label path="description" class="col-sm-2 col-form-label">Description: </form:label>
					<form:errors path="description" class="text-danger" />
					<div class="col-sm-4">
						<form:textarea path="description" type="text" class="form-control"></form:textarea>
					</div>
				</div>
				<button class="btn btn-primary">Submit</button>
			</form:form>
		</div>

	</div>
</body>
</html>