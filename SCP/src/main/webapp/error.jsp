
<%@page isThreadSafe="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error 404 - Page Not Found</title>
<style>
body {
	background-color: #f0f0f0; /* Light gray background */
	font-family: Arial, sans-serif; /* Font family for text */
	text-align: center; /* Center-align text */
	margin-top: 50px; /* Add margin to top */
}

h1 {
	color: #333; /* Dark text color */
	margin-bottom: 20px; /* Add space below heading */
}

.btn-back {
	padding: 10px 20px; /* Padding for button */
	background-color: #333; /* Dark background color for button */
	color: #fff; /* Text color for button */
	border: none; /* Remove button border */
	border-radius: 5px; /* Rounded corners */
	text-decoration: none; /* Remove default link decoration */
}

.btn-back:hover {
	background-color: #555; /* Darker background color on hover */
}
</style>
</head>
<body>
	<h1>Error 404 - Page Not Found</h1>
	<p>The page you are looking for does not exist.</p>
	<a href="javascript:history.back()" class="btn-back">Go Back</a>
</body>
</html>
