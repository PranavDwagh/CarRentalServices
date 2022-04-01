<!doctype html>
<html lang="en">

<head>
	<title>Welcome!</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/style.css">
</head>

<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<!-- <div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login #10</h2>
				</div>
			</div> -->
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<h3 class="mb-4 text-center">Have an account?</h3>
						<form action="#" class="signin-form">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Username" required>
							</div>
							<div class="form-group">
								<input id="password-field" type="password" class="form-control" placeholder="Password"
									required>
								<span toggle="#password-field"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
							<div class="form-group">
								<button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
							</div>
							<div>
								<button type="button" class="form-control btn btn-primary submit px-3"
									style="margin-top: 1%; background-color: aqua;" data-toggle="modal" data-target="#SignUp">Sign Up</button>
							</div>
							<div class="form-group justify-content-center">
								<div class="">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="modal fade" id="SignUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Create Account</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form action="#" class="signin-form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Firstname" required style=" color:black; background-color: burlywood; border-color: black;"><br>
							<input type="text" class="form-control" placeholder="Enter Lastname" required style="background-color: burlywood; color: black; border-color: black;"><br>
							<input type="text" class="form-control" placeholder="Enter Contact Number" required style="background-color: burlywood; color: black; border-color: black;"><br>
							<input type="text" class="form-control" placeholder="Enter Email ID" required style="background-color: burlywood; color: black; border-color: black;"><br>
							<input type="text" class="form-control" placeholder="Enter City" required style="background-color: burlywood; color: black; border-color: black;"><br>
							<input type="text" class="form-control" placeholder="Enter Pin Code" required style="background-color: burlywood; color: black; border-color: black; "><br>
							<select class="form-control" required style="background-color: burlywood; color: black; border-color: black; ">
								<option >Select State</option>
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
							</select><br>
							<input type="text" class="form-control" placeholder="Enter Username" required style="background-color: burlywood; color: black; border-color: black; "><br>
							<input id="password-field" type="password" class="form-control" placeholder="Enter Password"
								required style="background-color: burlywood; color: black; border-color: black; ">
							<span toggle="#password-field"
								class="fa fa-fw fa-eye field-icon toggle-password"></span><br>
								<input id="password-field" type="password" class="form-control" placeholder="Confirm Password"
								required style="background-color: burlywood; color: black; border-color: black; ">
							<span toggle="#password-field"
								class="fa fa-fw fa-eye field-icon toggle-password"></span>
						</div>
						<div>
							<button type="button" class="form-control btn btn-primary submit px-3 close"
								style="margin-top: 1%; background-color: aqua;" data-toggle="modal" data-target="#SignUp">Sign Up</button>
						</div>
					</form>
				</div>
            </div>
        </div>
    </div>
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>