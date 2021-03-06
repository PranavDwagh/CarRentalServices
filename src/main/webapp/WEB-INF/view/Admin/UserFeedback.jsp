<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<%@page import="com.carrentalservice.DTO.IFeedbackDTO"%>
<%@page import="java.util.List"%>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src = "js/jquery.min.js"></script>
</head>
<body>
    <div class="sidebar">
        <div class="logo-details">
            <i class='bx bxl-c-plus-plus'></i>
            <span class="logo_name">Car Rental Service</span>
        </div>
       <ul class="nav-links">
            <li>
                <a href="http://localhost:8080/loadAdminDashboard"  class="active">
                    <i class='bx bx-grid-alt'></i>
                    <span class="links_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadManageCars">
                    <i class='bx bx-box'></i>
                    <span class="links_name">Manage Cars</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadManageDrivers">
                    <i class='bx bx-list-ul'></i>
                    <span class="links_name">Manage Drivers</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadUserFeedback">
                    <i class='bx bx-pie-chart-alt-2'></i>
                    <span class="links_name">User Feedback</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadViewPayments">
                    <i class='bx bx-coin-stack'></i>
                    <span class="links_name">View Payments</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadViewBookings">
                    <i class='bx bx-book-alt'></i>
                    <span class="links_name">View Bookings</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadViewCustomers">
                    <i class='bx bx-user'></i>
                    <span class="links_name">View Customers</span>
                </a>
            </li>
            <li>
                <a href="http://localhost:8080/loadViewProfile">
                    <i class='bx bx-user'></i>
                    <span class="links_name">View Profile</span>
                </a>
            </li>
            <li class="log_out">
                <a href="http://localhost:8080/AdminLogin/index.html">
                    <i class='bx bx-log-out'></i>
                    <span class="links_name">Log out</span>
                </a>
            </li>
        </ul>
    </div>
    <section class="home-section">
        
        <div class = "container text-center">
            <h3>User Feedback</h3>
            <table class = "table table-bordered"> 
                <thead class = "">
                    <tr>
                       
                        <th scope="">Customer Name</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Description</th>
                        <th scope = "col"><button type = "button" class = "btn btn-warning">Refresh</button></th>
                    </tr>
                    <% List<IFeedbackDTO> list = (List<IFeedbackDTO>) request.getAttribute("viewFeedback"); 
                    	for(IFeedbackDTO feedback : list){
                    %>
                    <tr>
                        <th scope = "row"><%=feedback.getFirstName() %></th>
                        <th scope = "row"><%=feedback.getRating() %></th>
                        <th scope = "row"><%=feedback.getFeedback() %></th>
                    </tr>
                   <%} %>
            </table>
        </div>
    </section>
    <!-- <script>
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".sidebarBtn");
        sidebarBtn.onclick = function () {
            sidebar.classList.toggle("active");
            if (sidebar.classList.contains("active")) {
                sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            } else
                sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
        }
    </script> -->
<div></div>
</body>

</html>