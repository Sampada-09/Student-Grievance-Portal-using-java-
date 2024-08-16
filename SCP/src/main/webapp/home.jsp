<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>GCEK Complaint Portal</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- JQERY Typed -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
<!-- Custom CSS -->
<link rel="stylesheet" href="css/homestyles.css">
<style>
</style>
</head>
<body>
	<header>
		<!-- Navbar -->	
		<nav class="navbar">
			<div class="max-width">
				<div class="logo">
					<a href="#">GCEK<span> SGP</span></a>
				</div>
				<ul class="menu">
					<li><a href="#home" class="menu-btn">Home</a></li>
					<li><a href="registration.jsp" class="menu-btn">Register</a></li>
					<li><a href="#contact" class="menu-btn">Contact</a></li>
				</ul>
				<div class="menu-btn">
					<i class="fas fa-bars"></i>
				</div>
			</div>
		</nav>
	</header>

	<section class="home" id="home">
		<div class="max-width">

			<!-- Home Section Content -->
			<div class="home-content">
				<div class="text-1">Hello, I`m</div>
				<div class="text-2">Student Grievance Portal</div>
				<div class="text-3">
					and I'm here to register your Grievance of <br>
					<span class="typing">Hostel</span>
				</div>
				<!-- Contact me Button -->
				<a href="login_page.jsp">Login<i class='bx bx-send'></i></a>
			</div>
		</div>
	</section>


	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>$(document).ready(function(){

    $(window).scroll(function(){

        // sticky navbar on scroll - Fixed to Top
        if(this.scrollY > 30){
            $('.navbar').addClass("sticky");
        }else{
            $('.navbar').removeClass("sticky");
        }
        
        // slide-up Button
        if(this.scrollY > 500){
            $('.scroll-up-btn').addClass("show")
        }else{
            $('.scroll-up-btn').removeClass("show") 
        }

    });

    // slide-up - To move to Home Section from Anywhere
    $('.scroll-up-btn').click(function(){
         $('html').animate({ scrollTop: 0});
         $('html').css("scrollBehavior", "auto");
    });

    $('.navbar .menu li a').click(function(){
        $('html').css("scrollBehavior", "smooth");
    });


    // toggle menu bar of Navbar Sub-Content on Media Queries
    $('.menu-btn').click(function(){
        $('.navbar .menu').toggleClass("active");
        $('.navbar .menu i').toggleClass("active");
    });


    //  typing animation for Home Section
    var typed = new Typed(".typing",{
          strings:  [ "blank", "Bullying", "Academic", "Administrative"],
          typespeed: 130,
          backspeed:190,
          loop: true,
    });

});   </script>
</body>
</html>
