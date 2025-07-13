<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Employee List - CRM</title>

  <!-- Bootstrap 5 CSS and JS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Custom CSS -->
  <link rel="stylesheet" type="text/css" href="CSS/style.css"/>
</head>
<body>

 <jsp:include page="header-crm.jsp"/>

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
    <h2>Employees List</h2>
    <p>Below table displays only 10 employees</p>
    <table class="table table-light table-bordered table-striped">
      <thead>
        <tr>
          <th scope="col">Employee Name</th>
          <th scope="col">Employee Lastname</th>
          <th scope="col">Email</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>john@example.com</td>
        </tr>
        <tr>
          <td>Mary</td>
          <td>Moe</td>
          <td>mary@example.com</td>
        </tr>
        <tr>
          <td>July</td>
          <td>Dooley</td>
          <td>july@example.com</td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Footer -->
  <footer class="bg-light text-center py-3 mt-5">
    <p class="mb-0">&copy; 2025 CRM Application. All Rights Reserved.</p>
  </footer>

</body>
</html>
