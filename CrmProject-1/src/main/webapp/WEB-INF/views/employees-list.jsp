<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List, in.sp.main.entity.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee List - CRM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>

<%
    Employee emp = (Employee) request.getAttribute("employee");
    List<Employee> employeeList = (List<Employee>) request.getAttribute("model_list_emp");
    Integer currentPage = (Integer) request.getAttribute("model_current_page");
    Integer totalPages = (Integer) request.getAttribute("model_total_pages");
    if (currentPage == null) currentPage = 1;
    if (totalPages == null) totalPages = 1;
%>

<!-- Header -->
<div class="container-fluid bg-primary text-white py-2 px-4">
    <div class="row align-items-center">
        <div class="col-md-4 d-flex align-items-center">
            <img src="images/crmlogo-removebg-preview (1).png" width="40" height="40" class="me-2">
            <h5 class="mb-0">CRM Application</h5>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-4 d-flex justify-content-end align-items-center">
            <img src="images/profile1.png" alt="Admin" class="rounded-pill me-2" style="width: 40px;"> 
            <span class="me-3">Admin</span> 
            <a href="login" class="btn btn-sm btn-light">Logout</a>
        </div>
    </div>
</div>


<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container justify-content-center">
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="profileadmin">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Employees</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="addemployee">Add Employee</a></li>
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

<!-- Employee List -->
<div class="container mt-4">
    <h2>Employees List</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Full Name</th><th>Email</th><th>Phone</th><th class="text-center">Update</th><th class="text-center">Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (employeeList != null && !employeeList.isEmpty()) {
                for (Employee employee : employeeList) {
        %>
        <tr>
            <td><%= employee.getName() %></td>
            <td><%= employee.getEmail() %></td>
            <td><%= employee.getPhoneno() %></td>
            <td class="text-center">
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#updateEmpModal"
                    onclick="setUpdateModal('<%= employee.getId() %>', '<%= employee.getName() %>', '<%= employee.getEmail() %>', '<%= employee.getPhoneno() %>')">
                    <i class="bi bi-pencil-square"></i>
                </button>
            </td>
            <td class="text-center">
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteEmpModal"
                    onclick="setDeleteEmployeeId('<%= employee.getId() %>')">
                    <i class="bi bi-trash3-fill"></i>
                </button>
            </td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="5" class="text-center text-danger">No employees found.</td></tr>
        <% } %>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="d-flex justify-content-center">
        <ul class="pagination">
            <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                <a class="page-link" href="emplist?page=<%= currentPage - 1 %>">Previous</a>
            </li>
            <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= i == currentPage ? "active" : "" %>">
                    <a class="page-link" href="emplist?page=<%= i %>"><%= i %></a>
                </li>
            <% } %>
            <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                <a class="page-link" href="emplist?page=<%= currentPage + 1 %>">Next</a>
            </li>
        </ul>
    </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteEmpModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" action="deleteemployee">
            <div class="modal-content">
                <div class="modal-header"><h5 class="modal-title">Delete Employee</h5></div>
                <div class="modal-body">
                    Are you sure you want to delete this employee?
                    <input type="hidden" id="deleteEmpId" name="empId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes, Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Update Modal -->
<div class="modal fade" id="updateEmpModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" action="updateemployee">
            <div class="modal-content">
                <div class="modal-header"><h5 class="modal-title">Update Employee</h5></div>
                <div class="modal-body">
                    <input type="hidden" id="updateEmpId" name="id">
                    <div class="mb-3">
                        <label for="updateName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="updateName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="updateEmail" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="updatePhone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="updatePhone" name="phoneno" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function setDeleteEmployeeId(id) {
        document.getElementById("deleteEmpId").value = id;
    }

    function setUpdateModal(id, name, email, phoneno) {
        document.getElementById("updateEmpId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updateEmail").value = email;
        document.getElementById("updatePhone").value = phoneno;
    }
</script>
</body>
</html>
