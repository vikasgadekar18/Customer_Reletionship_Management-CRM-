<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin - Add Employee</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>

	<!-- Header -->
	<div class="container-fluid bg-primary text-white py-2 px-4">
		<div class="row align-items-center">
			<div class="col-md-4 d-flex align-items-center">
				<img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
					width="40" height="40" class="me-2">
				<h5 class="mb-0">CRM Application</h5>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4 d-flex justify-content-end align-items-center">
				<img src="images/profile1.png" alt="Admin" class="rounded-pill me-2"
					style="width: 40px;"> <span class="me-3">Admin</span> 
				<a href="login" class="btn btn-sm btn-light">Logout</a>
			</div>
		</div>
	</div>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container justify-content-center">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="profileadmin">Home</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Employees</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="emplist">Employee List</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Products</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Add Product</a></li>
							<li><a class="dropdown-item" href="#">Product List</a></li>
						</ul>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Complaints</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Form Section -->
	<div class="container py-3">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="card shadow p-4">
					<h4 class="text-center mb-3">Register Employee</h4>

					<!-- ✅ Display Success or Error Messages -->
					<% if (request.getAttribute("model_success") != null) { %>
						<div class="alert alert-success text-center" role="alert">
							<%= request.getAttribute("model_success") %>
						</div>
					<% } %>

					<% if (request.getAttribute("model_error") != null) { %>
						<div class="alert alert-danger text-center" role="alert">
							<%= request.getAttribute("model_error") %>
						</div>
					<% } %>

					<!-- Employee Form -->
					<form action="addempform" method="post">
						<div class="mb-3">
							<label class="form-label">Enter Full Name</label>
							<input type="text" name="name1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Email</label>
							<input type="email" name="email1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Password</label>
							<input type="password" name="pass1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Phone Number</label>
							<input type="number" name="phone1" class="form-control" required />
						</div>
						<div class="text-center">
							<input type="submit" value="Register" class="btn btn-primary" />
						</div>
					</form>
					<!-- End Form -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>
