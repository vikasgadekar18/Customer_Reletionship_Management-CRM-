<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="in.sp.main.entity.Employee" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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

<!-- Form -->
<div class="container mt-5">
    <h2>Update Employee</h2>
    <form action="<%=request.getContextPath()%>/updateemployee" method="post">
        <input type="hidden" name="id" value="<%= emp.getId() %>" />
        <input type="hidden" name="password" value="<%= emp.getPassword() %>" />

        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" value="<%= emp.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="<%= emp.getEmail() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone</label>
            <input type="text" class="form-control" name="phoneno" value="<%= emp.getPhoneno() %>" required>
        </div>

        <button type="submit" class="btn btn-success">Update</button>
        <a href="<%=request.getContextPath()%>/emplist" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
