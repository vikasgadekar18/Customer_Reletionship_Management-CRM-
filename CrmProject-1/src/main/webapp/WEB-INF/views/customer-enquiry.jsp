<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS and JS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS/style.css" />

    <script>
        $(document).ready(function () {
            $("#gethistorybtn").hide();

            $('#phonenoinput').on('keyup', function () {
                var phoneNumber = $(this).val();
                if (!phoneNumber) {
                    $('#phonenoinput').removeClass("is-invalid");
                    $("#gethistorybtn").hide();
                    return;
                }

                $.ajax({
                    url: "/checkphonenumberavailable",
                    method: "GET",
                    data: { phoneNumber: phoneNumber },
                    success: function (response) {
                        if (response === "exist") {
                            $('#phonenoinput').addClass("is-invalid");
                            disableForm();
                            $("#gethistorybtn").show();
                        } else {
                            $('#phonenoinput').removeClass("is-invalid");
                            enableForm();
                            $("#gethistorybtn").hide();
                        }
                    },
                    error: function () {
                        console.error("Error checking phone number availability");
                    }
                });
            });

            function disableForm() {
                $("#nameinput, #discussioninput, #followupdateinput").prop('readonly', true);
                $("#intrestedcourseinput, #inquirytypeinput, #statusinput, #calltoinput").prop('disabled', true);
                $("#addenquirybuttonid").prop('disabled', true);
            }

            function enableForm() {
                $("#nameinput, #discussioninput, #followupdateinput").prop('readonly', false);
                $("#intrestedcourseinput, #inquirytypeinput, #statusinput, #calltoinput").prop('disabled', false);
                $("#addenquirybuttonid").prop('disabled', false);
            }
        });

        function custEnquiryHistory() {
            var phoneNumber = $('#phonenoinput').val();
            if (phoneNumber !== '') {
                window.location.href = "/custEnquiryHistoryPage?phno=" + encodeURIComponent(phoneNumber);
            }
        }

        function handleOption() {
            var statusOption = document.getElementById('statusinput').value;
            $('#followupdateinput').prop('readonly', statusOption !== "1");
        }
    </script>
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

<!-- Navigation -->
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

<!-- Main Content -->
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow p-4">
                <h4 class="text-center mb-3">Customer Enquiry</h4>

                <!-- Flash Messages -->
                <%
                    String success = (String) request.getAttribute("redirect_success");
                    String error = (String) request.getAttribute("redirect_error");
                    if (success != null) {
                %>
                <div class="alert alert-success text-center"><%= success %></div>
                <% } if (error != null) { %>
                <div class="alert alert-danger text-center"><%= error %></div>
                <% } %>

                <!-- Enquiry Form -->
                <form action="customerenquiryform" method="post">
                    <!-- Phone No -->
                    <div class="mb-3">
                        <label class="form-label">Phone No</label>
                        <input type="text" name="phoneno" id="phonenoinput" class="form-control" value="${modelCustEnquiryAttr.phoneno}">
                        <div class="invalid-feedback">Phone number already exists. Click "Get History".</div>
                        <button type="button" id="gethistorybtn" class="btn btn-success mt-2" onclick="custEnquiryHistory()">Get History</button>
                        <small class="text-danger">${errors.phoneno}</small>
                    </div>

                    <!-- Name -->
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" name="customerEnquiry.name" id="nameinput" class="form-control" value="${modelCustEnquiryAttr.customerEnquiry.name}">
                        <small class="text-danger">${errors['customerEnquiry.name']}</small>
                    </div>
                    
                    

                    <!-- Interested Course -->
                    <div class="mb-3">
                        <label class="form-label">Interested Course</label>
                        <select name="customerEnquiry.interstedcourse" id="intrestedcourseinput" class="form-select">
                            <option value="">Select Course</option>
                            <%
                                List<String> courses = (List<String>) request.getAttribute("model_coursename_list");
                                if (courses != null) {
                                    String selected = (String) request.getAttribute("selectedCourse");
                                    for (String c : courses) {
                            %>
                            <option value="<%= c %>" <%= c.equals(selected) ? "selected" : "" %>><%= c %></option>
                            <% }} %>
                        </select>
                        <small class="text-danger">${errors['customerEnquiry.interstedcourse']}</small>
                    </div>

                    <!-- Discussion -->
                    <div class="mb-3">
                        <label class="form-label">Discussion</label>
                        <textarea name="customerEnquiry.discussion" id="discussioninput" class="form-control">${modelCustEnquiryAttr.customerEnquiry.discussion}</textarea>
                        <small class="text-danger">${errors['customerEnquiry.discussion']}</small>
                    </div>

                    <!-- Enquiry Type -->
                    <div class="mb-3">
                        <label class="form-label">Enquiry Type</label>
                        <select name="customerEnquiry.enquirytype" id="inquirytypeinput" class="form-select">
                            <option value="">Select Enquiry Type</option>
                            <option value="Call">Call</option>
                            <option value="Mail">Mail</option>
                            <option value="Website">Website</option>
                            <option value="Social Networking">Social Networking</option>
                        </select>
                        <small class="text-danger">${errors['customerEnquiry.enquirytype']}</small>
                    </div>

                    <!-- Status -->
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="customerEnquiry.status" id="statusinput" class="form-select" onchange="handleOption()">
                            <option value="">Select Status</option>
                            <option value="1">Open</option>
                            <option value="2">Interested - Close</option>
                            <option value="3">Not Interested - Close</option>
                            <option value="4">Purchased - Close</option>
                        </select>
                        <small class="text-danger">${errors['customerEnquiry.status']}</small>
                    </div>

                    <!-- Follow Up Date -->
                    <div class="mb-3">
                        <label class="form-label">Follow Up Date</label>
                        <input type="date" name="custFollowup.followupdate" id="followupdateinput" class="form-control" value="${modelCustEnquiryAttr.custFollowup.followupdate}">
                        <small class="text-danger">${errors['custFollowup.followupdate']}</small>
                    </div>

                    <!-- Call To -->
                    <div class="mb-3">
                        <label class="form-label">Call To</label>
                        <select name="customerEnquiry.callto" id="calltoinput" class="form-select">
                            <option value="">Call To</option>
                            <option value="Customer To Company">Customer To Company</option>
                            <option value="Company To Customer">Company To Customer</option>
                        </select>
                        <small class="text-danger">${errors['customerEnquiry.callto']}</small>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-center">
                        <input type="submit" value="Add Enquiry" id="addenquirybuttonid" class="btn btn-primary" />
                    </div>
                </form>
                <!-- End Form -->
            </div>
        </div>
    </div>
</div>

</body>
</html>
