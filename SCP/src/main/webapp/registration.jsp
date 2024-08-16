<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>SGP</title>
<link rel="stylesheet" href="css/regstyles.css">

</head>
<body>
	<header>
		<!-- showcase & nav -->
		<nav class="navbar">
			<div class="max-width">
				<!-- Navbar Heading -->
				<div class="logo">
					<a href="#">GCEK<span> SGP</span></a>
				</div>
				<!-- Navbar Sub-Content -->
				<ul class="menu">
					<li><a href="home.jsp" class="menu-btn">Home</a></li>
					<li><a href="login_page.jsp" class="menu-btn">Login</a></li>
					<li><a href="#contact" class="menu-btn">Contact</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container">
		<!-- Right side form container -->
		<form id="reg-form" action="RegServlet" method="post"
			class="form">
			<h2>Register</h2>
			<div class="input-container">
				<input type="text" id="fullName" name="fullname" required
					placeholder="Full Name">

			</div>
			<div class="input-container">
				<input type="email" id="email" name="email" required
					placeholder="Email Address">
			</div>
			<div class="input-container">
				<input type="text" id="rollno" name="rollno" required
					placeholder="Roll No">
			</div>


			<div class="input-container">
				<input type="password" id="password" name="password" required
					placeholder="Password">
			</div>

			<div class="chexbox">
				<input name="check" type="checkbox" class="custom-control-input"
					id="check" required> <label for="check">Terms and
					condition</label>
			</div>
			<div class="btn">
				<button class="signup-btn" type="submit">Sign Up</button>


				<p>
					Already have an account?<a href="login_page.jsp"><strong>Login</strong></a>
				</p>
			</div>
		</form>

		<!-- Left side image container -->

	</div>



	<!--javascripts-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    //send register servlet:
                    $.ajax({
                        url: "RegServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            

                            
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                           

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>

</body>
</html>
