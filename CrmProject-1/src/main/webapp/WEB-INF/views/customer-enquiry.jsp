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
                <li class="nav-item"><a class="nav-link" href="customerfollowuppage">Customer Follow Ups</a></li>
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
                <h4 class="text-center mb-3">Customer Enquiry</h4>

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

                <!-- Enquiry Form -->
                <form:form action="customerenquiryform" method="post" modelAttribute="modelCustEnquiryAttr">
                    <div class="mb-3">
                        <label class="form-label">Phone No</label>
                        <form:input path="phoneno" cssClass="form-control" />
                        <form:errors path="phoneno" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <form:input path="customerEnquiry.name" type="text" cssClass="form-control" />
                        <form:errors path="customerEnquiry.name" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Interested Course</label>
                        <form:select path="customerEnquiry.interstedcourse" cssClass="form-select">
                            <form:option value="">Select Course</form:option>
                            <form:options items="${model_coursename_list}" />
                        </form:select>
                        <form:errors path="customerEnquiry.interstedcourse" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Discussion</label>
                        <form:textarea path="customerEnquiry.discussion" cssClass="form-control" />
                        <form:errors path="customerEnquiry.discussion" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Enquiry Type</label>
                        <form:select path="customerEnquiry.enquirytype" cssClass="form-select">
                            <form:option value="">Select Enquiry Type</form:option>
                            <form:option value="Call">Call</form:option>
                            <form:option value="Mail">Mail</form:option>
                            <form:option value="Website">Website</form:option>
                            <form:option value="Social Networking">Social Networking</form:option>
                        </form:select>
                        <form:errors path="customerEnquiry.enquirytype" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <form:select path="customerEnquiry.status" cssClass="form-select">
                            <form:option value="">Select Status</form:option>
                            <form:option value="1">Open (1)</form:option>
                            <form:option value="2">Interested - Close (2)</form:option>
                            <form:option value="3">Not Interested - Close (3)</form:option>
                            <form:option value="4">Purchased - Close (4)</form:option>
                        </form:select>
                        <form:errors path="customerEnquiry.status" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Follow Up Date</label>
                        <form:input path="custFollowup.followupdate" type="date" cssClass="form-control" />
                        <form:errors path="custFollowup.followupdate" cssClass="text-danger small" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Call To</label>
                        <form:select path="customerEnquiry.callto" cssClass="form-select">
                            <form:option value="">Call To</form:option>
                            <form:option value="Customer To Company">Customer To Company</form:option>
                            <form:option value="Company To Customer">Company To Customer</form:option>
                        </form:select>
                        <form:errors path="customerEnquiry.callto" cssClass="text-danger small" />
                    </div>

                    <div class="text-center">
                        <input type="submit" value="Add Enquiry" class="btn btn-primary" />
                    </div>
                </form:form>
                <!-- End Form -->

            </div>
        </div>
    </div>
</div>

</body>
</html>
