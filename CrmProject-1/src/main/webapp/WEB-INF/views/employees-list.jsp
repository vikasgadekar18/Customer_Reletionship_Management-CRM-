<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List, in.sp.main.entity.Employee"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee List - CRM</title>

<!-- Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>

	<!-- Header -->
	<div class="container-fluid bg-primary text-white py-3 px-4">
		<div class="row align-items-center">
			<div class="col-md-4 d-flex align-items-center">
				<img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
					width="40" height="40" class="me-2">
				<h5 class="mb-0">CRM Application</h5>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4 d-flex justify-content-end align-items-center">
				<img src="images/profile1.png" alt="Admin"
					class="rounded-circle me-2" style="width: 40px;"> <span
					class="me-3">Admin</span> <a href="login"
					class="btn btn-sm btn-light">Logout</a>
			</div>
		</div>
	</div>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="container-fluid justify-content-center">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="profileadmin">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown">Employees</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="addemployee">Add
								Employee</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown">Products</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Add Product</a></li>
						<li><a class="dropdown-item" href="#">Product List</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="#">Complaints</a></li>
			</ul>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container mt-4">
		<h2>Employees List</h2>
		<p>This table displays the employees fetched from the backend.</p>

		<table class="table table-bordered table-striped table-hover">
			<thead class="table-dark">
				<tr>
					<th>Employee Full Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th style="text-align: center;">Update</th>
					<th style="text-align: center;">Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Employee> employeeList = (List<Employee>) request.getAttribute("model_list_emp");

				if (employeeList != null && !employeeList.isEmpty()) {
					for (Employee employee : employeeList) {
				%>
				<tr>
					<td><%=employee.getName()%></td>
					<td><%=employee.getEmail()%></td>
					<td><%=employee.getPhoneno()%></td>
					<td style="text-align: center;"><a href="#" style="color: green;"><i class="bi bi-pencil-square"></i></a></td>
					<td style="text-align: center;"><a href="#" style="color: red"> <i class="bi bi-trash3-fill"></i>
					</a>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="3" class="text-center text-danger">No employees
						found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		   
		%>
	</div>

	<!-- Footer -->
	<footer class="bg-light text-center py-3 mt-5">
		<p class="mb-0">&copy; 2025 CRM Application. All Rights Reserved.</p>
	</footer>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
