<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.List,in.sp.main.entity.CustomerEnquiry" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry History</title>
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
                        <img src="images/crmlogo-removebg-preview (1).png" alt="CRM Logo" width="40" height="40" class="me-2">
                        CRM Application
                    </a>
                </div>
                <div class="col-6"></div>
                <div class="col-3 d-flex align-items-center justify-content-end">
                    <a class="navbar-brand text-light" href="employeehome">
                        <img src="images/profile.png" alt="Welcome Admin" style="width: 40px;" class="rounded-pill">
                        ${session_emp.name}
                    </a>
                    <a href="logout" class="btn btn-sm btn-light ms-2">Logout</a>
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





<%
    // Fetch the list of customer enquiries from request
    List<CustomerEnquiry> list =
        (List<CustomerEnquiry>) request.getAttribute("model_custenquiry");
%>

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow p-4">
                <h4 class="text-center mb-3">Customer History</h4>

                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Discussion</th>
                            <th>Interested Course</th>
                            <th>Enquiry Date/Time</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if (list != null && !list.isEmpty()) {
                            for (CustomerEnquiry custenq : list) {
                                String discussion = custenq.getDiscussion() != null ? custenq.getDiscussion() : "";
                                String course = custenq.getInterstedcourse() != null ? custenq.getInterstedcourse() : "";
                                String date = custenq.getEnquirydate() != null ? custenq.getEnquirydate() : "";
                                String time = custenq.getEnquirytime() != null ? custenq.getEnquirytime() : "";
                    %>
                        <tr>
                            <td><%= discussion %></td>
                            <td><%= course %></td>
                            <td><%= date %> (<%= time %>)</td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="3" class="text-center">No customer enquiries found.</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>

</body>
</html>
