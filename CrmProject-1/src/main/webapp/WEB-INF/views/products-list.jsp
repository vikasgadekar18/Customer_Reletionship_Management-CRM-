<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.List, in.sp.main.entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

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
                        <li><a class="dropdown-item" href="emplist">Employee List</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Products</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="addproducts">Add Product</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Complaints</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="mb-4 text-center">Available Courses</h2>

    <table class="table table-bordered table-striped text-center">
        <thead class="table-dark">
            <tr>
                <th>Course Name</th>
                <th>Course Validity</th>
                <th>Course Price</th>
                <th>Trainer Name</th>
                <th>Trainer Image</th>
                <th>Full Details</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Product> list = (List<Product>) request.getAttribute("model_products_list");
                if (list != null && !list.isEmpty()) {
                    for (Product p : list) {
            %>
            <tr>
                <td><%= p.getCoursename() %></td>
                <td><%= p.getCoursevalidity() %></td>
                <td>
                    <del style="color:red;">₹ <%= p.getOriginalprice() %></del>
                    <b> ₹ <%= p.getDiscountedprice() %></b>
                </td>
                <td><%= p.getTrainersname() %></td>
                <td>
                    <img src="<%= p.getTrainersimage() %>" width="100" height="70" alt="Trainer Image">
                </td>
                <td>
                    <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#detailsModal<%= p.getId() %>">
                        <i class="bi bi-eye"></i>
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="detailsModal<%= p.getId() %>" tabindex="-1" aria-labelledby="modalLabel<%= p.getId() %>" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel<%= p.getId() %>">Course Details</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body text-start">
                                    <%= p.getOtherdetails() %>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <%   }
               } else {
            %>
            <tr>
                <td colspan="6">No products available</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="d-flex justify-content-center mt-4">
        <nav>
            <ul class="pagination">
                <%
                    int currentPage = (request.getAttribute("currentPage") != null) ? (int) request.getAttribute("currentPage") : 1;
                    int totalPages = (request.getAttribute("totalPages") != null) ? (int) request.getAttribute("totalPages") : 1;

                    if (currentPage > 1) {
                %>
                <li class="page-item">
                    <a class="page-link" href="productslist?page=<%= currentPage - 1 %>">Previous</a>
                </li>
                <%
                    }

                    for (int i = 1; i <= totalPages; i++) {
                %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <a class="page-link" href="productslist?page=<%= i %>"><%= i %></a>
                </li>
                <%
                    }

                    if (currentPage < totalPages) {
                %>
                <li class="page-item">
                    <a class="page-link" href="productslist?page=<%= currentPage + 1 %>">Next</a>
                </li>
                <%
                    }
                %>
            </ul>
        </nav>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
