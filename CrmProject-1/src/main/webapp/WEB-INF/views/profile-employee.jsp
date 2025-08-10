<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<%@ page import="in.sp.main.entity.Employee" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Employee</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" type="text/css" href="CSS/style.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
          <%= session.getAttribute("session_emp") != null ? ((in.sp.main.entity.Employee) session.getAttribute("session_emp")).getName() : "Guest" %>
        </a>
        <a href="logout" class="btn btn-sm btn-light">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container justify-content-center">
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="employeehome">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="customerenquirypage">Customer Enquiry</a></li>
        <li class="nav-item"><a class="nav-link" href="customerfollowuppage">Customer Follow Ups</a></li>
        <li class="nav-item"><a class="nav-link" href="salecourse">Sale Course</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Welcome Message -->
<div class="container mt-4">
  <h2>Welcome: <%= session.getAttribute("session_emp") != null ? ((in.sp.main.entity.Employee) session.getAttribute("session_emp")).getName() : "Guest" %></h2>
  <p>Now You Can Handle The Below Functionality</p>
</div>

<!-- Chart Canvas -->
<div class="container">
  <canvas id="myChart" style="width: 100%; max-width: 600px"></canvas>
</div>

<!-- Chart Script -->
<%
  List<Object[]> courseSaleList = (List<Object[]>) request.getAttribute("model_count_course_sale");
  StringBuilder xValues = new StringBuilder();
  StringBuilder yValues = new StringBuilder();

  if (courseSaleList != null) {
    for (int i = 0; i < courseSaleList.size(); i++) {
      Object[] row = courseSaleList.get(i);
      xValues.append("\"").append(row[0].toString()).append("\"");
      yValues.append(row[1].toString());

      if (i != courseSaleList.size() - 1) {
        xValues.append(", ");
        yValues.append(", ");
      }
    }
  }
%>


<script>
  const xValues = [<%= xValues.toString() %>];
  const yValues = [<%= yValues.toString() %>];

  new Chart("myChart", {
    type: "line",
    data: {
      labels: xValues,
      datasets: [{
        fill: false,
        lineTension: 0,
        backgroundColor: "rgba(0,0,255,1.0)",
        borderColor: "rgba(0,0,255,0.1)",
        data: yValues
      }]
    },
    options: {
      legend: { display: false },
      scales: {
        yAxes: [{
          ticks: {
            min: 0,
            max: 10
          }
        }]
      }
    }
  });
</script>

</body>
</html>
