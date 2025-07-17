<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee</title>

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
			<div class="row">
				<div class="col-3 d-flex align-items-center">
					<a href="profileadmin"
						class="navbar-brand text-light d-flex align-items-center ps-0">
						<img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
						width="40" height="40" class="me-2"> CRM Application
					</a>
				</div>
				<div class="col-6"></div>
				<div class="col-3 d-flex align-items-center justify-content-end">
					<a class="navbar-brand text-light" href="#"> <img
						src="images/profile.png" alt="Welcome Admin" style="width: 40px;"
						class="rounded-pill"> ${session_emp.getName()}
					</a> <a href="logout" class="btn btn-sm btn-light">Logout</a>
					
					
				</div>
			</div>
		</div>
	</div>
	<div class="container mt-4">
		<h2>Welcome: ${session_emp.getName()}</h2>
		<p>Now You Can Handle The Below Functionality</p>

	</div>