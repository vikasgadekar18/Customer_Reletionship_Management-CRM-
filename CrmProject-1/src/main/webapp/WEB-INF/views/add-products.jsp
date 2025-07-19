<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Products</title>
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
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow p-4">
                    <h4 class="text-center mb-3">Add Course Details</h4>

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
                    <form:form action="addcourseform" method="post" modelAttribute="" >
                        <div class="mb-3">
                            <label class="form-label">Course Name</label>
                            <form:input path="coursename" cssClass="form-control" />
                            <form:errors path="coursename" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Syllabus</label>
                            <form:input path="syllabus" type="email" cssClass="form-control" />
                            <form:errors path="syllabus" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Original Price</label>
                            <form:input path="originalprice" cssClass="form-control" />
                            <form:errors path="originalprice" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Discounted Price</label>
                            <form:input path="discountedprice" cssClass="form-control" />
                            <form:errors path="discountedprice" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Validity</label>
                            <form:input path="coursevalidity" cssClass="form-control" />
                            <form:errors path="coursevalidity" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course Image</label>
                            <form:input path="courseimage" cssClass="form-control" />
                            <form:errors path="courseimage" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trainers Details</label>
                            <form:input path="trainersdetails" cssClass="form-control" />
                            <form:errors path="trainersdetails" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trainers image</label>
                            <form:input path="trainersimage" cssClass="form-control" />
                            <form:errors path="trainersimage" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Other Details</label>
                            <form:input path="otherdetails" cssClass="form-control" />
                            <form:errors path="otherdetails" cssClass="text-danger small" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trainers Name</label>
                            <form:input path="trainersname" cssClass="form-control" />
                            <form:errors path="trainersname" cssClass="text-danger small" />
                        </div>
                        <div class="text-center">
                            <input type="submit" class="btn btn-primary" value="Add Course" />
                        </div>
                    </form:form>
                    <!-- End Form -->

                </div>
            </div>
        </div>
    </div>

</body>
</html>
