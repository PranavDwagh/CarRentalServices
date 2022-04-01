<!doctype html>
<html lang="en">

<head>
	<title>Admin Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <script src = "http://localhost:8080/js/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">
	<script>
	function adminLogin(){
		$(document).ready(()=>{
			var loginURL = "/adminLogin/"+$("#username").val()+"/"+$("#password").val();
			console.log(loginURL);
			$.ajax({
				url : loginURL,
				type : "POST",
				success : function(){
					
				}
			})
		})
	} //end of adminLogin()
	</script>
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="login-wrap p-4 p-md-5">
						<div class="d-flex justify-content-center">
							<div class="w-200 ">
								<h3 class="mb-4 ">Sign In</h3>
							</div>
						</div>
						<form action="http://localhost:8080/loadAdminDashboard" class="login-form">
							<div class="form-group">
								<div class="icon d-flex align-items-center justify-content-center"><span
										class="fa fa-user"></span></div>
								<input type="text" class="form-control rounded-left" placeholder="Username" required id = "username">
							</div>
							<div class="form-group">	
								<div class="icon d-flex align-items-center justify-content-center"><span
										class="fa fa-lock"></span></div>
								<input type="password" class="form-control rounded-left" placeholder="Password"
									required id = "password">
							</div>
							<div class="form-group d-flex justify-content-center">
								<div class="">
									<button type="submit" class="btn btn-primary rounded submit" onclick = "adminLogin()">Login</button>
								</div>
							</div>
							<div class="form-group mt-4">
								<div class="w-100 text-center">
									<p class="mb-1">Don't have an account? <a href="#" data-toggle="modal" data-target="#SignUp">Sign Up</a></p>
									<p><a href="#">Forgot Password</a></p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="modal fade" id = "SignUp">
		<div class="modal-body">
			
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>