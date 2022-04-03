<%@page import="java.util.HashMap"%>
<%@page import="com.carrentalservice.entity.Admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="http://localhost:8080/style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src = "http://localhost:8080/js/jquery.min.js"></script>
   <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script>
	$(document).ready(()=>{
		$.ajax({
			url : `/admin/getAdminName`,
			type : "GET",
			success : function(adminName){
				console.log(adminName);
				$("#adminName").text(adminName);
			}
		})
		console.log(addAdminURL);	
	})
	/* below function to add new admin */
	function addAdminDetails(){
		$(document).ready(()=>{
			var addAdminURL = "/addAdmin/"+$("#adminFirstName").val()+"/"+$("#adminLastName").val()+"/"+$("#adminContactNumber").val()+"/"+$("#adminUserName").val()+"/"+$("#adminPassword").val();
			$.ajax({
				url : addAdminURL,
				type : "POST",
				success : function(data){
					alert("HEY");
				}
			})
			console.log(addAdminURL);	
		})
	} //end of function addAdminDetails();
</script>
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
    <% int carsCount = (int)request.getAttribute("carsCount"); 
       int driversCount = (int) request.getAttribute("driversCount");
       int customersCount = (int) request.getAttribute("customersCount");
       int payment = (int) request.getAttribute("amount");
       int driverAvail = (int)request.getAttribute("driversAvailCount");
       int driverReserved = (int)request.getAttribute("driversReservedCount");
       int availCount = (int)request.getAttribute("availCount");
       int reservedCount = (int)request.getAttribute("reservedCount");
       %>
       
        <nav>
            <div class="profile-details">
                <!--<img src="images/profile.jpg" alt="">-->
                <span class="admin_name" id="adminName">Logged In as :  </span>
            </div>
            <buttoon class="btn btn-primary" data-toggle="modal" data-target="#addNewAdmin">Add a new Admin</button>
        </nav>
        <div class="home-content">
        <div class="modal fade" tabindex="-1" role="dialog" id = "addNewAdmin">
        	<div class="modal-dialog" role="document">
      			<div class="modal-content">
            			<div class="modal-header">
              				<h5 class="modal-title">Add Car</h5>
              				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    			<span aria-hidden="true">&times;</span>
              				</button>
    					</div>
    				<div class="modal-body">
      					<input type="text" class="text-primary" placeholder="Enter Admin FirstName" id="adminFirstName" required><br>
      					<input type="text" class="text-primary" placeholder="Enter Admin Lastname" id="adminLastName" required><br>
      					<input type="text" class="text-primary" placeholder="Enter Admin Contact Number" id="adminContactNumber" required><br>
      					<input type="text" class="text-primary" placeholder="Enter Admin Username" id="adminUserName" required><br>
      					<input type="password" class="text-primary" placeholder="Enter Admin Password" id="adminPassword" required>
    				</div>
    				<div class="modal-footer">
      					<button type="button" class="btn btn-primary " onclick = "addAdminDetails()" data-dismiss="modal">Add Admin</button>
      					<button type="button" class="btn btn-secondary " data-dismiss="modal">Cancel</button>
    				</div>
  				</div>
			</div>
		</div>
            <div class="overview-boxes">
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Users</div>
                        <div class="number"><%=customersCount %></div>
                    </div>
                    <i class='bx bx-cart-alt cart'></i>
                </div>
                
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Payment</div>
                        <div class="number"><%=payment %></div>
                    </div>
                    <i class='bx bxs-cart-add cart two'></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Cars</div>
                        <div class="number" id="carsCount">
                        	<!-- Count of Cars Will be displayed here. -->
                        	<%=carsCount %>
                        </div>
                    </div>
                    <i class='bx bx-cart cart three'></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Drivers</div>
                        <div class="number" id = "driversCount"><%=driversCount %></div>
                        <!-- <div class="indicator">
              <i class='bx bx-down-arrow-alt down'></i>
              <span class="text">Down From Today</span>
            </div> -->
                    </div>
                    <i class='bx bxs-cart-download cart four'></i>
                </div>
                
                <div class="box" style="margin-top:20px;">
                    <div class="right-side">
                        <div class="box-topic">Available Drivers</div>
                        <div class="number" id = "driversCount"><%=driverAvail %></div>
                        <!-- <div class="indicator">
              <i class='bx bx-down-arrow-alt down'></i>
              <span class="text">Down From Today</span>
            </div> -->
                    </div>
                    <i class='bx bxs-cart-download cart four'></i>
                </div>
                <div class="box" style="margin-right:%;">
                    <div class="right-side">
                        <div class="box-topic">Available Cars</div>
                        <div class="number" id = "driversCount"><%=availCount %></div>
                    </div>
                    <i class='bx bxs-cart-download cart four'></i>
                </div>
                <div class="box" style="margin-right:%;">
                    <div class="right-side">
                        <div class="box-topic">Reserved Cars</div>
                        <div class="number" id = "driversCount"><%=reservedCount %></div>
                    </div>
                    <i class='bx bxs-cart-download cart four'></i>
                </div>
                
                <div class="box" style="margin-right:%;">
                    <div class="right-side">
                        <div class="box-topic">Reserved Drivers</div>
                        <div class="number" id = "driversCount"><%=driverReserved %></div>
                    </div>
                    <i class='bx bxs-cart-download cart four'></i>
                </div>
                
                
                
                
                
            </div>

    </section>
    <!-- 
    <script>
        let sidebar = document.qerySelector(".sidebar");
        let sidebarBtn = document.querySelector(".sidebarBtn");
        sidebarBtn.onclick = function () {
            sidebar.classList.toggle("active");
            if (sidebar.classList.contains("active")) {
                sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            } else
                sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
        }
    </script>
    -->     
</body>
</html>