<%@page import="java.sql.*"%>
<%@page import="entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="dbcon.ConnectionProvider"%>
<%@page import="DAO.CompDAO"%>
<%@page import="java.io.Console"%>
<%@page import="entities.*"%>
<%@page import="helper.*"%>


<%
Admin ad = (Admin) session.getAttribute("currentUser");
if (ad == null) {
	response.sendRedirect("login_page.jsp");
} else {
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Your existing styles and scripts -->

<link rel="stylesheet" href="css/aprofstyles.css">

</head>
<body>
	<div class="container1">
		<div class="container">
			<img src="img/d.png" style="width: 5cm; height: 5cm">
			<h2>GCEK SGP</h2>
			<p>Welcome Admin to Dashboard</p>
			<%=ad.getName()%>
			<%
			Message msg = (Message) session.getAttribute("msg");

			if (msg != null) {
			%>
			<div class="alert alert-danger" role="alert">
				<%=msg.getContent()%>
			</div>

			<%
			session.removeAttribute("msg");
			}
			%>

			<div class="card-box">

				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" onclick="getComps(0)">All
						Complaints</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<%
						CompDAO dao1 = new CompDAO(ConnectionProvider.getCon());
						ArrayList<Category> list1 = dao1.getAllCategories();

						for (Category cat : list1)

						{
						%>
						<a onclick="getComps(<%=cat.getId()%>)" class="dropdown-item"
							href="#"><%=cat.getName()%></a>
						<%
						}
						%>
					</div>
				</div>
			</div>

			<div class="card-box">
				<a href="#!" data-toggle="modal" data-target="#adminprofile">
					Profile <i class="fa-solid fa-plus"></i>
				</a>
			</div>
			<div class="card-box">
				<a href="#!" data-toggle="modal" data-target="#checkStatus">Check
					Status <i class="fa-thin fa-ballot-check"></i>
				</a>
			</div>

			<div class="card-box">
				<a href="SignOutServlet">Logout <i class='fa fa-sign-out'></i></a>
			</div>

		</div>
	</div>

	<div class="container" id="comp-container">
		<div class="container" id="loader">
			<i class="fa fa-refresh fa-3x fa-spin"></i>
		</div>
	</div>

	<div class="modal fade" id="adminprofile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title"
						style="text-align: left; text-color: white;"
						id="exampleModalLabel">Profile</h5>
				</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="background-color: white;">
				<!-- Display the user's name from the session -->


				<div class="container">

					<!-- details -->
					<div id="profile-detail">
						<table class="table">

							<tbody>
								<tr>
									<th scope="row">ID :</th>
									<td style="text-align: center;"><%=ad.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Name :</th>
									<td style="text-align: center;"><%=ad.getName()%></td>
								</tr>
								<tr>
									<th scope="row">Roll No:</th>
									<td style="text-align: center;"><%=ad.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Designation :</th>
									<td style="text-align: center;"><%=ad.getDesignation()%></td>
								</tr>
								<tr>
									<th scope="row">Password :</th>
									<td style="text-align: center;"><%=ad.getPassword()%></td>
								</tr>

							</tbody>
						</table>

					</div>


				</div>

			</div>

		</div>
	</div>


	<!-- Check Status Modal -->

	<!-- Your existing HTML code -->

<!-- Modal for Complaint Stats -->
<div class="modal fade checkStatus" id="checkStatus" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="text-align: left; text-color: white;" id="exampleModalLabel">Complaint Stats</h5>
            </div>
            <div class="container">
                <h2>we are checking status here</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Your existing JavaScript code -->


	<!-- LOADING COMPLAINTS USING AJAX -->
	<script type="text/javascript">
		function getComps(catId) {
			$.ajax({

				url : "load_comp.jsp",
				data:{cat_id:catId},

				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#comp-container").html(data);

				}
			})
		}
		$(document).ready(function(e) {
			getComps(0);
		})
	</script>

</body>
</html>
<%
}
%>
