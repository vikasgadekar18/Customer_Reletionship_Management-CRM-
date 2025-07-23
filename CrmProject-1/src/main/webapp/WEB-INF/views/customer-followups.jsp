<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Optional Custom CSS -->
    <link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>

<!-- Header -->
<div class="container-fluid bg-primary header_design">
    <div class="container-fluid px-3">
        <div class="row">
            <div class="col-3 d-flex align-items-center">
                <a href="profile-employee" class="navbar-brand text-light d-flex align-items-center ps-0">
                    <img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo"
                         width="40" height="40" class="me-2"> CRM Application
                </a>
            </div>
            <div class="col-6"></div>
            <div class="col-3 d-flex align-items-center justify-content-end">
                <a class="navbar-brand text-light" href="employeehome">
                    <img src="images/profile.png" alt="Welcome Admin" style="width: 40px;" class="rounded-pill">
                    ${session_emp.getName()}
                </a>
                <a href="logout" class="btn btn-sm btn-light">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container justify-content-center">
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="employeehome">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="customerenquirypage">Customer Enquiry</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Complaints</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow p-4">
                <h4 class="text-center mb-3">Customer Follow Ups</h4>

                <!-- Success & Error Messages -->
                <%
                    String success = (String) request.getAttribute("redirect_success");
                    String error = (String) request.getAttribute("redirect_error");
                %>
                <% if (success != null) { %>
                    <div class="alert alert-success text-center" role="alert"><%= success %></div>
                <% } %>
                <% if (error != null) { %>
                    <div class="alert alert-danger text-center" role="alert"><%= error %></div>
                <% } %>
                
                <p> Below Are The Details Of Customers To Be Called</p>
                
                 <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Sr.No</th>
                <th>Name</th>
                <th>Phone No</th>
                <th class="text-center">Get History</th>

            </tr>
        </thead>
      </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
