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
  <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
</head>
<body>

  <!-- Header -->
  <div class="container-fluid bg-primary header_design">
    <div class="container-fluid px-3">
      <div class="row">
        <div class="col-3 d-flex align-items-center">
          <a href="#" class="navbar-brand text-light d-flex align-items-center ps-0">
            <img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo" width="40" height="40" class="me-2">
            CRM Application
          </a>
        </div>
        <div class="col-6"></div>
        <div class="col-3 d-flex align-items-center justify-content-end">
          <div class="dropdown">
            <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown">More</button>
            <ul class="dropdown-menu">
              <li><a href="#" class="dropdown-item ">Home</a></li>
              <li><a href="#" class="dropdown-item bg-secondary text-light">Login</a></li>
              <li><a href="#" class="dropdown-item">About Us</a></li>
              <li><a href="#" class="dropdown-item">Contact Us</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container-fluid  py-5" style="text-align: center;">
    <div class="container">
      <div class="row">
        <div class="col-4"></div>
        <div class="col-4 bg-light login_div_design ">
            <h3>Login Here</h3><br>
            <div class="mb-3">
                <label class="form-label">Enter Email</label>
                <input type="text" name="email1" class="form-control"/>
            </div>
             <div class="mb-3">
                <label class="form-label">Enter Password</label>
                <input type="password" name="email1" class="form-control"/>
            </div>
            <div class="form-text"> We will Not Share Your Information To Anyone</div> <br>
            <div>
                <input type="submit" value="Login" class="btn btn-primary"/>
            </div>
        </div>
        <div class="col-4"></div>
        </div>
        </div>
        </div>
</body>
</html>
    