<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>

	<!-- Bootstrap 5 CSS and JS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>

	<jsp:include page="header-crm.jsp"/>
	<%
	 String login_error =(String) request.getAttribute("model_error");
	%>

	<div class="container-fluid py-5 text-center">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4 bg-light p-4 rounded shadow login_div_design">
				  <%  
				    if(login_error != null){
				    	%>
				    	<h5 style="color:red"><%= login_error %> </h5>
				    	<%
				    }
				    
				    %>
					<form action="loginform" method="post">
						<h3 class="mb-4">Login Here</h3>
						<div class="mb-3 text-start">
							<label class="form-label">Enter Email</label>
							<input type="text" name="email1" class="form-control" required />
						</div>
						<div class="mb-3 text-start">
							<label class="form-label">Enter Password</label>
							<input type="password" name="pass1" class="form-control" required />
						</div>
						<div class="form-text mb-3">We will not share your information with anyone.</div>
						<div>
							<input type="submit" value="Login" class="btn btn-primary w-100" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
