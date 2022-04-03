<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<%@page import="com.carrentalservice.DTO.IBookingView"%>
<%@page import="com.carrentalservice.entity.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.carrentalservice.BookingRepository"%>
<html lang="en" dir="ltr">

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      /*   $(document).ready(()=>{
            $.ajax({
                url:`/booking/getAllBooking`,
                type:'GET',
                success:(data)=>{
                    console.log(data);
                    // var t = $(`<tbody><tbody>`)
                     var d = $(`<table><table>`)
                    // $("#tbl").html("")
                    for(var i=0; i<data.length;i++)
                    {
                        var id= data[i].bookingId;
                        var MyName = data[i].customerName;
                        var s = data[i].source;
                        var destination = data[i].destination;
                        var drivername = data[i].driverName;
                        var vehiclename = data[i].vehicleName;
                        var rating = data[i].rating;
                        var amount = data[i].amount
                        var journeyDateandTime = data[i].journeyDateandTime;
                        var rating = data[i].rating;
                        console.log("here"+i);
                        console.log(MyName)
                        console.log(amount);
                        
                        d.append(`<tr>
                        <td >${i}</td>
                        <td >${MyName}</td>
                        <td >${journeyDateandTime}</td>
                        <td >${source}</td>
                        <td >${destination}</td>
                        <td >${amount}</td>
                        <td>${rating}</td>
                        <td><button type = "button" data-bookingId=${bookingId} onclick="fun(this)" class = "btn btn-success">Complete Ride</button></td>
                    </tr>`)
                    }
                    {
                        $("#tbl").append(d);
                    }
                   
                }
            })
            
       })*/
            function fun(ele)
            {
                var id = ele.getAttribute("data-bookingId");
                console.log(id);
                $.ajax({
                    url: `/booking/completeride/`+id,
                    type:"Post",
                    success:(data)=>{
                        
                    }
                })
            }
        

    </script>



</head>


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
   
    <section class="home-section" style="overflow: hidden;">
        <div class = "container text-center">
            <h3>Bookings</h3>
            <table id="tbl" class = "table table-bordered"> 
              
                    <tr>
                        <th scope="col">Sr No</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Journey Date and Time</th>
                        <th scope="col">Source</th>
                        <th scope="col">Destination</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Change Ride Status</th>
                        <th scope = "col"><button  type = "button" class = "btn btn-warning"><a href=http://localhost:8080/loadViewBookings>Refresh</a></button></th>
                    </tr>
              
               <% 
                   List<IBookingView> list  = (List<IBookingView>)request.getAttribute("viewBooking");
               	int i=1;		
               for(IBookingView data : list )
               		{  %>
               	
                <tr>
                    <th scope="col"><%=i++ %></th>
                    <th scope="col"><%=data.getCustomerName() %></th>
                    <th scope="col"><%=data.getJourneyDateandTime() %></th>
                    <th scope="col"><%=data.getSource() %></th>
                    <th scope="col"><%=data.getDestination() %></th>
                    <th scope="col"><%=data.getAmount() %></th>
                    <th scope="col"><%=data.getRating() %></th>
                   
                    <td><button type = "button" data-bookingId=<%=data.getBookingId() %> onclick="fun(this)" class = "btn btn-success">Complete Ride</button></td>
                </tr>
                 	<%}
               %>
            </table>

        </div>
        <div id = "dis" class="tbl-content">

        </div>
        <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
          
              <button id type = "button" class = "btn btn-success"><a href=http://localhost:8080/loadAllBookings>Get All Rides</a></button>
            
          </nav>
    </section> 
<!--  -->



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