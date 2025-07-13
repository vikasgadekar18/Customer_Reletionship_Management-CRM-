<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin</title>

  <!-- Bootstrap 5 CSS and JS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Custom CSS -->
  <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
</head>
<body>

  <!-- Header -->
  <div class="container-fluid bg-primary header_design">
    <div class="container-fluid px-3">
      <div class="row">
        <div class="col-3 d-flex align-items-center">
          <a href="profileadmin" class="navbar-brand text-light d-flex align-items-center ps-0">
            <img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo" width="40" height="40" class="me-2">
            CRM Application
          </a>
        </div>
        <div class="col-6"></div>
        <div class="col-3 d-flex align-items-center justify-content-end">
          <a class="navbar-brand text-light" href="#">
            <img src="images/profile.png" alt="Welcome Admin" style="width:40px;" class="rounded-pill"> 
            Admin
          </a>
          <a href="login" class="text-light"> Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-sm bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Employees</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Add Employee</a></li>
              <li><a class="dropdown-item" href="#">Employee List</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Products</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Add Product</a></li>
              <li><a class="dropdown-item" href="#">Product List</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Complaints</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="container mt-4">
    <h2>Welcome Admin</h2>
    <p>Now You Can Handle The Below Functionality</p>

  </div> 
</body>
</html>
