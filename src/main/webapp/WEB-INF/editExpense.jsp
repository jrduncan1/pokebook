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
<title>Edit Expense</title>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center col-6">
			<h1>Edit Expense:</h1>
			<a href="/"><button class="btn btn-warning">Dashboard</button></a>
		</div>
		<form:form action="/edit/${expense.id}" method="post" modelAttribute="expense" class="form">
			<input type="hidden" name="_method" value="put" />
			<div class="row mb-2">
				<form:errors path="expenseName" class="text-danger" />
				<form:label path="expenseName" class="col-sm-2 col-form-label">Expense Name: </form:label>
				<div class="col-sm-4">
					<form:input path="expenseName" type="text" class="form-control" />
				</div>
			</div>
			<div class="row mb-2">
				<form:errors path="vendor" class="text-danger" />
				<form:label path="vendor" class="col-sm-2 col-form-label">Vendor: </form:label>
				<div class="col-sm-4">
					<form:input path="vendor" type="text" class="form-control" />
				</div>
			</div>
			<div class="row mb-2">
				<form:errors path="amount" class="text-danger" />
				<form:label path="amount" class="col-sm-2 col-form-label">Amount: </form:label>
				<div class="col-sm-4">
					<form:input path="amount" type="number" step="0.01"
						class="form-control" />
				</div>
			</div>
			<div class="row mb-2">
				<form:errors path="description" class="text-danger" />
				<form:label path="description" class="col-sm-2 col-form-label">Description: </form:label>

				<div class="col-sm-4">
					<form:textarea path="description" type="text" class="form-control"></form:textarea>
				</div>
			</div>
			<button class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</body>
</html>