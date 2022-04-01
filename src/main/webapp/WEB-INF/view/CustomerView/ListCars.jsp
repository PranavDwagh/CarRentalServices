<%@page import="com.carrentalservice.entity.Vehicle"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

  <head>
    <title>CarOnDemand &mdash; Free Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/aos.css">
	<script src = "http://localhost:8080/js/Jquery-3.0.6.js"></script>
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="http://localhost:8080/CustomerResources/css/style.css">
<script>
	$(document).ready(()=>{
		$.ajax({
			url : `vehicleController/getAllVehicles`,
			type: "GET",
			success : function(vehicleList){
				console.log(vehicleList);
				var table = $(`<table class="table table-bordered"></table>`)
				for(var v=0; v<vehicleList.length; v++){
					console.log(${vehicleList[v].vehicle_name})
					table.append(`<tr><td>${vehicleList[v].vehicle_name}</td></tr>`);
				}
				$("#displayCars").append(table);
			}
		})
	})
	
	</script>
  </head>

  <body style="background-image: linear-gradient(to right,rgb(0, 0, 0),rgba(47, 110, 153, 0.267)) , url(images/supercar22.jpg) ;"  data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3 ">
              <div class="site-logo">
                <a class="font-size-25" href="index.html">CarOnDemand</a>              </div>
            </div>

            <div class="col-9  text-right">
              

              <span class="d-inline-block d-lg-none"><a href="#" class="text-white site-menu-toggle js-menu-toggle py-5 text-white"><span class="icon-menu h3 text-white"></span></a></span>

              

              <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="font-size-18"><a href="index.html" class="nav-link">Home</a></li>
                  <li><a class="font-size-18" href="services.html" class="nav-link">Profile</a></li>
                  <li><a class="font-size-18" href="about.html" class="nav-link">Ride History</a></li>
                  <li><a  class="font-size-18" href="Login.html" class="nav-link">Log Out</a></li>
                  <!-- <li><a href="contact.html" class="nav-link">Contact</a></li> -->
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </header>
       <div style="align-self: center; padding-top: 10%; padding-left: 5%;">
       <div id="displayCars">
       
       </div>
       </div>
    <script src="http://localhost:8080/CustomerResources/js/jquery-3.3.1.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/popper.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/bootstrap.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/owl.carousel.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/jquery.sticky.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/jquery.waypoints.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/jquery.animateNumber.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/jquery.fancybox.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/jquery.easing.1.3.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/bootstrap-datepicker.min.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/aos.js"></script>
    <script src="http://localhost:8080/CustomerResources/js/main.js"></script>
  </body>
</html>