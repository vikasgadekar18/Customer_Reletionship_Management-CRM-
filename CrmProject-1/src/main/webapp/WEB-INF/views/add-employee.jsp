<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin</title>

<!-- Bootstrap 5 CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>

	<!-- Header -->
	<div class="container-fluid bg-primary header_design">
		<div class="container-fluid px-3">

			<c:if test="${ not empty model_success}">
				<div class="row">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						 ${model_success}
						<button type="button" class=" btn-close" data-dismiss="alert" aria-label="Close">
							
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</div>

			</c:if>
			<c:if test="${ not empty model_error}">
				<div class="row">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						 ${model_error}
						<button type="button" class=" btn-close" data-dismiss="alert" aria-label="Close">
							
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</div>

			</c:if>



			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<a href="images/profileadmin"
						class="navbar-brand text-light d-flex align-items-center ps-0">
						<img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
						width="40" height="40" class="me-2"> CRM Application
					</a>
				</div>
				<div class="col-6"></div>
				<div class="col-3 d-flex align-items-center justify-content-end">
					<a class="navbar-brand text-light" href="#"> <img
						src="images/profile1.png" alt="Welcome Admin" style="width: 40px;"
						class="rounded-pill"> Admin
					</a> <a href="login" class="text-light ms-3">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-sm bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="profileadmin">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">Employees</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="emplist">Employee List</a></li>
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
		</div>
	</nav>

	<!-- Title -->
	<div class="container mt-3">
		<h3 class="text-center">Register Employee</h3>
	</div>

	<!-- Registration Form -->
	<div class="container py-3">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="employee_login bg-light p-4 rounded shadow">
					<h3 class="text-center">Register Here</h3>
					<!-- employee form details -->
					<form action="addempform" method="post">
						<div class="mb-3">
							<label class="form-label">Enter Name</label> <input type="text"
								name="name1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Email</label> <input type="email"
								name="email1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Password</label> <input
								type="password" name="pass1" class="form-control" required />
						</div>
						<div class="mb-3">
							<label class="form-label">Enter Phone Number</label> <input
								type="text" name="phone1" class="form-control" required />
						</div>
						<div class="form-text mb-3 text-center">We will not share
							your information with anyone.</div>
						<div class="text-center">
							<input type="submit" value="Register" class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
