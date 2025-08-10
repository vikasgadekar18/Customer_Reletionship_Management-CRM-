<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Optional: Custom CSS -->
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
                            <li><a class="dropdown-item" href="addproducts">Add Product</a></li>
                            <li><a class="dropdown-item" href="productslist">Product List</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#">Complaints</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Form Section -->
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h4 class="text-center mb-3">Register Employee</h4>

                    <!-- Success or Error Messages -->
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
                    <form:form action="addempform" method="post" modelAttribute="employee">
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <form:input path="name" cssClass="form-control" />
                            <form:errors path="name" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input path="email" type="email" cssClass="form-control" />
                            <form:errors path="email" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <form:password path="password" cssClass="form-control" />
                            <form:errors path="password" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <form:input path="phoneno" cssClass="form-control" />
                            <form:errors path="phoneno" cssClass="text-danger small" />
                        </div>
                        <div class="text-center">
                            <input type="submit" class="btn btn-primary" value="Register" />
                        </div>
                    </form:form>
                    <!-- End Form -->

                </div>
            </div>
        </div>
    </div>

</body>
</html>
