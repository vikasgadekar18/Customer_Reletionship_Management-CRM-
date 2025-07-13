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
<jsp:include page="header-crm.jsp"/>
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
