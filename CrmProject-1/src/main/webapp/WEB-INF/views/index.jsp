<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CRM Application</title>

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
					<a href="#"
						class="navbar-brand text-light d-flex align-items-center ps-0">
						<img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
						width="40" height="40" class="me-2"> CRM Application
					</a>
				</div>
				<div class="col-6"></div>
				<div class="col-3 d-flex align-items-center justify-content-end">
					<div class="dropdown">
						<button type="button" class="btn btn-info dropdown-toggle"
							data-bs-toggle="dropdown">More</button>
						<ul class="dropdown-menu">
							<li><a href="#"
								class="dropdown-item bg-secondary text-light">Home</a></li>
							<li><a href="#" class="dropdown-item">Login</a></li>
							<li><a href="#" class="dropdown-item">About Us</a></li>
							<li><a href="#" class="dropdown-item">Contact Us</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Banner Section -->
	<div class="container-fluid bg-dark">
		<div class="row main_page_banner">
			<div class="col-md-8 p-5">
				<span class="main_page_title"> CRM application empowers a
					global network of over 250,000 businesses in 180 countries to
					convert more leads, engage with customers, and grow their revenue.
				</span>
			</div>
			<div class="col-md-4 p-5">
				<img src="images/crmlogo3.png" height="250" alt="CRM Banner Image" />
			</div>
		</div>
	</div>

	<!-- Info Section -->
	<div class="container-fluid bg-light py-5">
		<div class="container">
			<div class="row">
				<!-- What CRM Does -->
				<div class="col-md-6">
					<h3>What does CRM do?</h3>
					<ul>
						<li>Customer Data Management</li>
						<li>Lead Management</li>
						<li>Sales Tracking</li>
						<li>Task & Activity Tracking</li>
						<li>Email & Communication Integration</li>
						<li>Customer Support</li>
						<li>Reports & Analytics</li>
					</ul>
				</div>

				<!-- Why CRM Matters -->
				<div class="col-md-6">
					<h3>Why CRM Matters?</h3>
					<ul>
						<li>🔍 Centralizes Customer Information — all customer data
							in one place.</li>
						<li>⚙️ Improves Efficiency — automates tasks and reduces
							manual work.</li>
						<li>📈 Boosts Sales and Retention — close more deals and
							improve service.</li>
						<li>📊 Provides Actionable Insights — track KPIs and make
							smarter decisions.</li>
						<li>🧠 Better Customer Understanding — know preferences and
							needs easily.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
