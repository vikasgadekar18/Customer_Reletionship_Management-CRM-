<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.List, in.sp.main.entity.CustFollowup" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Follow Ups</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="CSS/style.css" />

    <script type="text/javascript">
        function getSelectedDate() {
            var selectedDate = $("#datePickerId").val();
            $.ajax({
                type: "GET",
                url: "/customerfollowuppage",
                data: { selectedDate: selectedDate },
                success: function (data) {
                    var newTableBody = $(data).find("#followuptable tbody").html();
                    $("#followuptable tbody").html(newTableBody);
                },
                error: function (xhr, status, error) {
                    alert("Error: " + error);
                }
            });
        }
        

        function custEnquiryHistory(phoneNumber) {
            if (phoneNumber && phoneNumber.trim() !== '') {
                window.location.href = "/custEnquiryHistoryPage?phoneno=" + encodeURIComponent(phoneNumber);
            } else {
                alert("Phone number is missing");
            }
        }
    </script>
</head>
<body>

<!-- Header -->
<div class="container-fluid bg-primary text-white py-2 px-4 d-flex justify-content-between align-items-center">
    <div>
        <a href="profile-employee" class="text-white text-decoration-none">
            <img src="images/crmlogo-removebg-preview (1).png" width="40" height="40" class="me-2">
            CRM Application
        </a>
    </div>
    <div>
        <a href="employeehome" class="text-white me-3">
            <img src="images/profile.png" width="40" class="rounded-pill me-1">
            ${session_emp.getName()}
        </a>
        <a href="logout" class="btn btn-sm btn-light">Logout</a>
    </div>
</div>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container justify-content-center">
        <div class="navbar-nav">
            <a class="nav-link" href="employeehome">Home</a>
            <a class="nav-link" href="customerenquirypage">Customer Enquiry</a>
            <a class="nav-link" href="salecourse">Sale Course</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <div class="card shadow p-4">
        <h4 class="text-center mb-4">Customer Follow Ups</h4>

        <!-- Flash Messages -->
        <%
            String success = (String) request.getAttribute("redirect_success");
            String error = (String) request.getAttribute("redirect_error");
        %>
        <% if (success != null) { %>
            <div class="alert alert-success text-center"><%= success %></div>
        <% } %>
        <% if (error != null) { %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>

        <p>Below are the details of customers to be called today.</p>
        <div class="mb-3">
            <label for="datePickerId">Or choose a date:</label>
            <input type="date" id="datePickerId" class="form-control" onchange="getSelectedDate()">
        </div>

        <!-- Follow-Up Table -->
        <table id="followuptable" class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Sr.No</th>
                    <th>Phone No</th>
                    <th class="text-center">Get History</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CustFollowup> followups = (List<CustFollowup>) request.getAttribute("model_followups");
                    if (followups != null && !followups.isEmpty()) {
                        int srNo = 1;
                        for (CustFollowup followup : followups) {
                %>
                    <tr>
                        <td><%= srNo++ %></td>
                        <td><%= followup.getPhoneno() %></td>
                        <td class="text-center">
                            <button class="btn btn-success"
                                    onclick="custEnquiryHistory('<%= followup.getPhoneno() %>')">
                                Get History
                            </button>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="3" class="text-center text-muted">No follow-up data found for this date.</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
