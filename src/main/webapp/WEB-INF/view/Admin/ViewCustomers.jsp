<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<%@page import="java.util.List"%>
<%@page import="com.carrentalservice.entity.Customer"%>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    </style>
    <script src = "js/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
function deleteCustomerById(customerId){
	$(document).ready(()=>{
		$.ajax({
			url : '/deleteCustomerById/'+customerId,
			type:"POST"
		})
	})
}
</script>
</head>
<body style = "overflow-x:hidden">
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
    <div class = "container">
            <h3 style = "text-align:center;">Customers</h3>
        <table class = "table table-bordered">
        <%List<Customer> customer = (List<Customer>) request.getAttribute("customerData"); %>
        	<tr>
        		<th>Name</th>
        		<th>Contact Number</th>
        		<th>UserName</th>
        		<th>Email Id</th>
        		<th>City</th>
        		<th>PinCode</th>
        		<th>State</th>
        		<td><a href = "" class = "btn btn-warning">Refresh</a></td>
        	</tr>
        	<%for(Customer customers : customer) {%>
	        	<tr>
		        	<td><%=customers.getFirstname() %> <%=customers.getLastname() %></td>
		        	<td><%=customers.getContactNo() %></td>
		        	<td><%=customers.getUsername() %></td>
		        	<td><%=customers.getEmail() %></td>
		        	<td><%=customers.getCity() %></td>
		        	<td><%=customers.getPincode() %></td>
		        	<td><%=customers.getState() %></td>
		        	<td><a href="http://localhost:8080/loadViewCustomers" class = "btn btn-danger" onclick = "deleteCustomerById(<%=customers.getId()%>)">Delete</a></td>
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