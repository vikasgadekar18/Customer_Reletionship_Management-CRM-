<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="in.sp.main.entity.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sale Course</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/style.css" />
    <script>
        function getSelectedCourse() {
            var selectedcourse = document.getElementById('coursename').value;
            if (selectedcourse !== "") {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "/getCoursePrices?selectedcourse=" + selectedcourse, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        document.getElementById("originalpriceid").textContent = response.originalprice;
                        document.getElementById("discountedpriceid").textContent = response.discountedprice;
                        document.getElementById("priceDivId").style.visibility = "visible";
                    } else if (xhr.readyState === 4) {
                        alert("Failed to load course price. Please try again.");
                    }
                };
                xhr.send();
            }
        }
    </script>
</head>
<body>

<%
    Employee emp = (Employee) session.getAttribute("session_emp");
    String empName = (emp != null) ? emp.getName() : "User";
%>

<!-- Header -->
<div class="container-fluid bg-primary text-white py-2 px-3">
    <div class="d-flex justify-content-between align-items-center">
        <a href="profile-employee" class="text-white text-decoration-none d-flex align-items-center">
            <img src="images/crmlogo-removebg-preview (1).png" width="40" height="40" class="me-2">
            CRM Application
        </a>
        <div class="d-flex align-items-center">
            <span class="me-2"><%= empName %></span>
            <img src="images/profile.png" alt="Profile" width="40" height="40" class="rounded-circle me-2">
            <a href="logout" class="btn btn-light btn-sm">Logout</a>
        </div>
    </div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container justify-content-center">
        <div class="collapse navbar-collapse justify-content-center">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="employeehome">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="customerenquirypage">Customer Enquiry</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Customer Follow Ups</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Form Section -->
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4">
                <h4 class="text-center mb-3">Sale Course</h4>

                <!-- Flash Messages -->
                <% 
                    String model_success = (String) request.getAttribute("model_success");
                    String model_error = (String) request.getAttribute("model_error");
                    if (model_success != null) {
                %>
                    <div class="alert alert-success text-center"><%= model_success %></div>
                <% } else if (model_error != null) { %>
                    <div class="alert alert-danger text-center"><%= model_error %></div>
                <% } %>

                <!-- Form Start -->
                <form:form action="salecourseForm" method="post" modelAttribute="modelSaleCourseAttr">
                    <div class="mb-3">
                        <label class="form-label">Customer Phone No.</label>
                        <form:input path="custphoneno" cssClass="form-control" />
                        <form:errors path="custphoneno" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Interested Course</label>
                        <select name="coursename" class="form-select" id="coursename" onchange="getSelectedCourse()">
                            <option value="">-- Select Course --</option>
                            <%
                                List<String> courseList = (List<String>) request.getAttribute("model_coursename_list");
                                if (courseList != null) {
                                    for (String course : courseList) {
                            %>
                                        <option value="<%= course %>"><%= course %></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <%
                            String courseError = (String) request.getAttribute("errors_coursename");
                            if (courseError != null) {
                        %>
                            <small class="text-danger"><%= courseError %></small>
                        <% } %>
                    </div>

                    <div class="mb-3" id="priceDivId" style="visibility:hidden;">
                        Price To Pay:
                        <strong><del>Rs. <span id="originalpriceid" style="color:red"></span></del></strong>
                        &nbsp;&nbsp;Rs. <span id="discountedpriceid" class="text-primary"></span>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary px-4">Sale Course</button>
                    </div>
                </form:form>
                <!-- End Form -->

            </div>
        </div>
    </div>
</div>

</body>
</html>