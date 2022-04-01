<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<%@page import="com.carrentalservice.entity.Driver"%>
<%@page import="java.util.List"%>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <script src = "js/jquery.min.js"></script>
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
	function deleteDriver(driverID){
		console.log(driverID);
		var driverIdURL = "/deleteDriverById/"+driverID;
		console.log(driverIdURL);
		$.ajax({
			url : driverIdURL,
			type : "POST"
		})	
	} //end of function updateVehicle();
	function addDriverDetails(){
		var driverFirstName = $("#driverFirstName").val();
		var driverLastName = $("#driverLastName").val();
		var driverContactNumber = $("#driverContactNumber").val();
		var driverLicenseNumber= $("#driverLicenseNumber").val();
		var driverCity= $("#driverCity").val();
		var driverPinCode = $("#driverPinCode").val();
		var driverStatus = $("#driverAvail").val();
		var driverState = $("#driverState").val();
		console.log(driverState);
		driverdata = {
			"firstname" : driverFirstName,
			"lastname" : driverLastName,
			"constactNo" : driverContactNumber,
			"license" : driverLicenseNumber,
			"status" : driverStatus,
			"city" : driverCity,
			"pincode" : driverPinCode,
			"state" : driverState
		}
		console.log(driverdata);
		$(document).ready(()=>{
			$.ajax({
				url : '/driver/add',
				type : "POST",
				data : JSON.stringify(driverdata),
				beforeSend : function(req, setting){
					req.setRequestHeader("Content-Type", "application/json")
				}
			})
		})
	}
	var getDriverId;
	function getDriverById(driverId){
		getDriverId = driverId;
		console.log(driverId);
		$(document).ready(()=>{
			$.ajax({
				url : "/driver/getDriverById/"+driverId,
				type : "POST",
				success : function(driverData){
					console.log(driverData);
					$("#hiddenPropertyId").append(driverData.id);
					$("#updatedDriverFirstName").val(driverData.firstname);
					$("#updatedDriverLastName").val(driverData.lastname);
					$("#updatedDriverContactNumber").val(driverData.constactNo);
					$("#updatedDriverLicenseNumber").val(driverData.license);
					$("#updatedDriverCity").val(driverData.city);
					$("#updatedDriverPinCode").val(driverData.pincode);
				}
			})
		})
	} //end of updateVehicle();
	function updateDriverData(){
		var driverId = getDriverId;
		var driverFirstName = $("#updatedDriverFirstName").val();
		var driverLastName = $("#updatedDriverLastName").val();
		var driverContactNumber = $("#updatedDriverContactNumber").val();
		var driverLicenseNumber= $("#updatedDriverLicenseNumber").val();
		var driverCity= $("#updatedDriverCity").val();
		var driverPinCode = $("#updatedDriverPinCode").val();
		var driverStatus = $("#updatedDriverAvail").val();
		var driverState = $("#updatedDriverState").val();
		driverdata = {
			"id": driverId,
			"firstname" : driverFirstName,
			"lastname" : driverLastName,
			"constactNo" : driverContactNumber,
			"license" : driverLicenseNumber,
			"status" : driverStatus,
			"city" : driverCity,
			"pincode" : driverPinCode,
			"state" : driverState
		}
		console.log(driverdata);
		$(document).ready(()=>{
			$.ajax({
				url : '/driver/update',
				type : "POST",
				data : JSON.stringify(driverdata),
				beforeSend : function(req, setting){
					req.setRequestHeader("Content-Type", "application/json")
				}
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
            <h3 style = "text-align:center;">Manage Drivers</h3>
            <%List<Driver> driverDetails = (List<Driver>)request.getAttribute("driverDetails");
            int driverId=0;%>
            <%!
            
            public void getDriver(int driverid){
            		
            }
           	%>
            <table class = "table table-bordered justify-content-center"> 
                <tr>
                	<th>Driver Name</th>
                	<th>Contact Number</th>
                	<th>License Number</th>
                	<th>Driver Status</th>
                	<th>City</th>
                	<th>Pin code</th>
                	<th>State</th>
                	<td>   <button type = "button" class = "btn btn-primary" data-toggle="modal" data-target="#addDriver">Add Driver</button>    <a href = "http://localhost:8080/loadManageDrivers" class = "btn btn-warning" id = "">Refresh</a></td>
                </tr>
            	<%for (Driver drivers  : driverDetails) {%>
            	<tr style="padding-left:-10%;">
            		<td><%=drivers.getFirstname() %> <%=drivers.getLastname() %></td>
            		<td><%=drivers.getConstactNo() %></td>
            		<td><%=drivers.getLicense() %></td>
            		<%if(drivers.getStatus()==1){%>
            			<td>Available</td>
            		<%}else{ %>
            			<td>Reserved</td>
            		<%} %>
            		<td><%=drivers.getCity()%></td>
            		<td><%=drivers.getPincode()%></td>
            		<td><%=drivers.getState()%></td>
            		<td><button class = "btn btn-success" onclick = getDriverById(<%=drivers.getId() %>) data-toggle="modal" data-target="#updateDriver">Update</button>    <button class = "btn btn-danger" onclick = deleteDriver(<%=drivers.getId() %>)>Delete</button></td>
            	</tr>
            	<%} %>
            </table>
            <div class="modal fade" tabindex="-1" role="dialog" id = "addDriver">
        	<div class="modal-dialog" role="document">
      			<div class="modal-content">
            			<div class="modal-header">
              				<h5 class="modal-title">Add Car</h5>
              				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    			<span aria-hidden="true">&times;</span>
              				</button>
    					</div>
    				<div class="modal-body">
      				<input type="text" class="text-primary" placeholder="Enter Driver FirstName" id="driverFirstName">
      					<input type="text" class="text-primary" placeholder="Enter Driver LastName" id="driverLastName">
      					<input type="text" class="text-primary" placeholder="Enter Contact Number" id="driverContactNumber">
      					<input type="text" class="text-primary" placeholder="Enter the LicenseNumber" id="driverLicenseNumber">
      					<input type="text" class="text-primary" placeholder="Enter the City" id="driverCity">
      					<input type="text" class="text-primary" placeholder="Enter the PinCode" id="driverPinCode">
      					<select id = "driverAvail">
      						<option value = "1">Available</option>
      						<option value = "2">Reserved</option>
      					</select>
      					<select id = "driverState">
      							<option>Select State</option>
								<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Arunachal Pradesh">Arunachal Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Bihar">Bihar</option>
								<option value="Chandigarh">Chandigarh</option>
								<option value="Chhattisgarh">Chhattisgarh</option>
								<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
								<option value="Daman and Diu">Daman and Diu</option>
								<option value="Delhi">Delhi</option>
								<option value="Goa">Goa</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Maharashtra">Maharashtra</option>
      					</select>
    				</div>
    				<div class="modal-footer">
      					<a  type="button" class="btn btn-primary" onclick = "addDriverDetails()">Add Car</a>
      					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    				</div>
  				</div>
			</div>
		</div>
        </div>
        <div class="modal fade" tabindex="-1" role="dialog" id = "updateDriver">
        	<div class="modal-dialog" role="document">
      			<div class="modal-content">
            			<div class="modal-header">
              				<h5 class="modal-title">Add Driver</h5>
              				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    			<span aria-hidden="true">&times;</span>
              				</button>
    					</div>
    				<div class="modal-body">
      					<input type="text" class="text-primary" id="updatedDriverFirstName">
      					<input type="text" class="text-primary" id="updatedDriverLastName">
      					<input type="text" class="text-primary" id="updatedDriverContactNumber">
      					<input type="text" class="text-primary" id="updatedDriverLicenseNumber">
      					<input type="text" class="text-primary" id="updatedDriverCity">
      					<input type="text" class="text-primary" id="updatedDriverPinCode">
      					<select id = "updatedDriverAvail">
      						<option value = "1">Available</option>
      						<option value = "2">Reserved</option>
      					</select>
      					<select id = "updatedDriverState">
      							<option>Select State</option>
								<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Arunachal Pradesh">Arunachal Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Bihar">Bihar</option>
								<option value="Chandigarh">Chandigarh</option>
								<option value="Chhattisgarh">Chhattisgarh</option>
								<option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
								<option value="Daman and Diu">Daman and Diu</option>
								<option value="Delhi">Delhi</option>
								<option value="Goa">Goa</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Maharashtra">Maharashtra</option>
      					</select>
    				</div>
    				<div class="modal-footer">
      					<a  type="button" class="btn btn-primary" onclick = "updateDriverData()">Update Driver Details</a>
      					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    				</div>
  				</div>
			</div>
		</div>
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