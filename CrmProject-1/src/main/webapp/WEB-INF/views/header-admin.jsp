<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<li class="nav-item"><a class="nav-link" href="profileadmin">Home</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">Employees</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Add Employee</a></li>
							<li><a class="dropdown-item" href="#">Employee List</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">Products</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="adddproducts">Add Product</a></li>
							<li><a class="dropdown-item" href="productslist">Product List</a></li>
						</ul></li>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>