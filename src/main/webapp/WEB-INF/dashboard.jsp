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
		<div class="mt-4 mb-5 col-10">
			<table class="table table-light table-striped">
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td><a href="/expense/${expense.id}">${expense.expenseName}</a></td>
						<td>${expense.vendor}</td>
						<td><fmt:formatNumber value="${expense.amount}" type="currency" /></td>
						<td>
							<div class="d-flex">
								<a href="/edit/<c:out value="${expense.id}"></c:out>"><button class="btn btn-secondary me-3">Edit</button></a>
								<form action="/delete/${expense.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete" class="btn btn-danger">
								</form>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="mt-3 p-4 border border-primary col-9">
			<h3 class="mb-5">Track an Expense:</h3>
			<form:form action="/" method="post" modelAttribute="newExpense" class="form">
				<div class="row mb-2">
					<form:errors path="expenseName" class="text-danger" />
					<form:label path="expenseName" class="col-sm-2 col-form-label">Expense Name: </form:label>
					<div class="col-sm-6">
						<form:input path="expenseName" type="text" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:errors path="vendor" class="text-danger" />
					<form:label path="vendor" class="col-sm-2 col-form-label">Vendor: </form:label>
					<div class="col-sm-6">
						<form:input path="vendor" type="text" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:errors path="amount" class="text-danger" />
					<form:label path="amount" class="col-sm-2 col-form-label">Amount: </form:label>
					<div class="col-sm-6">
						<form:input path="amount" type="number" step="0.01" class="form-control"/>
					</div>
				</div>
				<div class="row mb-2">
					<form:errors path="description" class="text-danger" />
					<form:label path="description" class="col-sm-2 col-form-label">Description: </form:label>
					
					<div class="col-sm-6">
						<form:textarea path="description" type="text" class="form-control"></form:textarea>
					</div>
				</div>
				<button class="btn btn-primary">Submit</button>
			</form:form>
		</div>

	</div>
</body>
</html>