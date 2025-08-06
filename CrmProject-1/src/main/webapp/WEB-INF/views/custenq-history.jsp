<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.List,in.sp.main.entity.CustomerEnquiry" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Enquiry Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function handelOption() {
        var status = document.getElementById("statusinput").value;

        // Example behavior: disable follow up date for closed statuses (2, 3, 4)
        var followupDateInput = document.getElementById("followupdateinput");

        if (status === "2" || status === "3" || status === "4") {
            followupDateInput.disabled = true;
            followupDateInput.value = "";
        } else {
            followupDateInput.disabled = false;
        }
    }

    // Optional: call it on page load to apply logic based on default selected value
    window.onload = function () {
        handelOption();
    };
</script>
    

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
              
            </ul>
        </div>
    </div>
</nav>

<%
    List<CustomerEnquiry> list = (List<CustomerEnquiry>) request.getAttribute("model_custenquiry");
%>

<!-- Main Content -->
<div class="container py-4">
    <div class="row">
        <!-- Left: Customer History -->
        <div class="col-md-6">
            <div class="card shadow p-4">
                <h4 class="mb-3">Customer History</h4>
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
                            <td colspan="4" class="text-center">No customer enquiries found.</td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Right: Add Enquiry Form -->
        <div class="col-md-5 offset-md-1">
            <div class="card shadow p-4">
                <h4 class="mb-3">Add Customer Enquiry</h4>
                <form action="customerenquiryform" method="post">
                    <!-- Hidden Fields -->
                    <input type="hidden" name="customerEnquiry.name" value="${model_custenq[0].name}" />
                    <input type="hidden" name="phoneno" value="${model_custenq[0].phoneno}" />

                    <!-- Interested Course -->
                    <div class="mb-3">
                        <label class="form-label">Interested Course</label>
                        <select name="customerEnquiry.interstedcourse" id="intrestedcourseinput" class="form-select">
                            <option value="">Select Course</option>
                            <%
                                java.util.List<String> courses = (java.util.List<String>) request.getAttribute("model_coursename_list");
                                if (courses != null) {
                                    String selected = (String) request.getAttribute("selectedCourse");
                                    for (String c : courses) {
                            %>
                                <option value="<%= c %>" <%= (c.equals(selected) ? "selected" : "") %>><%= c %></option>
                            <%
                                    }
                                }
                            %>
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
                        <select name="customerEnquiry.status" id="statusinput" class="form-select" onchange="handelOption()">
                            <option value="">Select Status</option>
                            <option value="1">Open (1)</option>
                            <option value="2">Interested - Close (2)</option>
                            <option value="3">Not Interested - Close (3)</option>
                            <option value="4">Purchased - Close (4)</option>
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

                    <!-- Submit -->
                    <div class="text-center">
                        <input type="submit" value="Add Enquiry" id="addenquirybuttonid" class="btn btn-primary" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
