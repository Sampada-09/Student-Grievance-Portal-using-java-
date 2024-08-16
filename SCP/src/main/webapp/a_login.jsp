<%@page import="entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/loginstyles.css"> 

<title>Login</title>

<style>

</style>
</head>
<body>
	<div class="navbar">
  <div class="max-width">
  <div class="logo">
					<a href="#">GCEK<span> SGP</span></a>
				</div>
    <ul class="menu">
      <li class="nav-item">
        <a class="nav-link active" href="home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="registration.jsp">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="login_page.jsp">UserLogin</a>
      </li>
    </ul>
  </div>
  
</div>
	<br>
	<br>

	<div id="login-container">
		<h1>
			<strong>Admin Login</strong>
		</h1>

		<%
		Message m = (Message) session.getAttribute("msg");

		if (m != null) {
		%>
		<div class="alert alert-danger" role="alert">
			<%=m.getContent()%>
		</div>

		<%
		session.removeAttribute("msg");
		}
		%>
		<form id="login-form" action="AdminLoginServlet" method="post" class="form-group">
			<div class="form-group">
				<label for="email">Email:</label> <input type="text" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required> <br> <br>
			</div>
			<div class="form-group">
				<input type="submit" value="Login">
			</div>
		</form>
	</div>

</body>
<footer>
	<p>All rights reserved &copy; GCEK SGP</p>
</footer>
</html>