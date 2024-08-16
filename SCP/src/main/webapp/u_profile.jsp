<%@page import="entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="dbcon.ConnectionProvider"%>
<%@page import="DAO.CompDAO"%>
<%@page import="java.io.Console"%>
<%@page import="entities.*"%>
<%@page import="helper.*"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
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

<link rel="stylesheet" href="css/uprofstyles.css">

</head>
<body>

	<div class="container">
		<img src="img/d.png" style="width: 5cm; height: 5cm">
		<h2>GCEK SGP</h2>
		<p>
			Welcome to Dashboard
			<%=user.getFullname()%>
		</p>
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
			<a href="#!" data-toggle="modal" data-target="#profilemodal">Profile
				<i class="fa-regular fa-user"></i>
			</a>
		</div>

		<div class="card-box">
			<a href="#!" data-toggle="modal" data-target="#addComplaints">Add
				Complaints <i class="fa-solid fa-plus"></i>
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
	<div class="container1"></div>


	<!-- Profile Modal -->
	<div class="modal fade" id="profilemodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header" style="background-color: black;">

					<h5 class="modal-title" style="text-align: left; color: white;"
						id="exampleModalLabel">SGP</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">

						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Display the user's name from the session -->

					<div class="container">
						<img alt="not show" style="height: 3cm; width: 3cm;"
							src="img/<%=user.getProfile()%>">


						<div class="container">
							<%=user.getFullname()%>
						</div>
						<!-- details -->
						<div id="profile-detail">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td style="text-align: center;"><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td style="text-align: center;"><%=user.getFullname()%></td>
									</tr>
									<tr>
										<th scope="row">Roll No:</th>
										<td style="text-align: center;"><%=user.getRollno()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td style="text-align: center;"><%=user.getEmail()%></td>
									</tr>


									<tr>
										<th scope="row">Registered Date :</th>
										<td style="text-align: center;"><%=user.getRdatetime()%></td>
									</tr>



								</tbody>
							</table>
						</div>

						<!-- End of Profile Modal -->

						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">

							<h3 class="mt-2">Please Edit Carefully</h3>

							<form action="EditProfServlet" method="post"
								enctype="multipart/form-data">

								<table class="table">

									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="text" class="form-control" name="email"
											value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="fullname" value="<%=user.getFullname()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>New Profile Picture:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-success">Save</button>
								</div>
							</form>

						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Add complaints modal -->

	<!-- Modal -->
	<div class="modal fade" id="addComplaints" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide
						Complaint details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-comp-form" action="AddCompServlet" method="post"
						enctype="multipart/form-data">
						<div class="form-group" name="cat_id">
							<label>Select Type of Complaint</label><br> <select
								name="cat_id" class="form-control" required>
								<option selected disabled="disabled">Select category</option>
								<%
								CompDAO dao = new CompDAO(ConnectionProvider.getCon());
								ArrayList<Category> list = dao.getAllCategories();
								for (Category cat : list) {
								%>
								<option value="<%=cat.getId()%>"><%=cat.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<label>Description:</label><br>
							<textarea name="comp_description" class="form-control"
								style="height: 200px;"
								placeholder="Description of your complaint" required></textarea>
						</div>

						<div class="form-group">
							<label class="red-label">Upload only images</label><br> <input
								type="file" name="comp_uploads" accept="image/*" required>
						</div>
				</div>

				<div class="form-group">
					<label>Complaint against:</label><br> <input type="radio"
						id="recipient-dean" name="recipient" value="4" required> <label
						for="recipient-dean">HOD</label><br> 
						<input type="radio"
						id="recipient-hod" name="recipient" value="3" required> <label
						for="recipient-hod">Course Co-ordinator</label><br> 
						<input
						type="radio" id="recipient-coordinator" name="recipient" value="2"
						required><label for="recipient-coordinator">Student</label><br>
					<input type="radio" id="recipient-coordinator" name="recipient"
						value="2" required><label for="recipient-coordinator">Teaching
						Staff</label><br>
				</div>

				<div class="form-group">
					<input type="checkbox" name="check" required> <label>I
						hereby declare that all the above information is true to the best
						of my knowledge</label><br>
				</div>

				<div class="container">
					<button type="submit" class="btn btn-outline-primary">Submit</button>
				</div>
				</form>

			</div>
		</div>
	</div>
	</div>


	<!-- Check Status Modal -->
	<div class="modal fade bd-example-modal-lg" id="checkStatus"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Check Status</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Complaint Id</th>
								<th scope="col">Description</th>
								<th scope="col">Uploads</th>
								<th scope="col">Status</th>
								<th scope="col">Remark</th>

							</tr>
						</thead>
						<tbody>
							<%
							CompDAO dao1 = new CompDAO(ConnectionProvider.getCon());

							int userId = user.getId();
							List<Complaints> comps = null;

							if (userId == 0) {
								response.sendRedirect("a_profile");
							} else {
								comps = dao1.getCompbyUserId(userId);

							}
							if (comps.size() == 0) {
								out.println("<h1 style='text-align: center;'>no complaints available</h1>");
							}
							for (Complaints c : comps) {
							%>

							<tr>
								<td><%=c.getComp_id()%></td>
								<td><%=c.getComp_description()%></td>
								<td><%=c.getComp_uploads()%></td>
								<td><%=c.getComp_status()%></td>
								<td><%=c.getComp_remark()%></td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- JavaScript -->
	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$("#edit-profile-btn").click(function() {
				if (editStatus == false) {
					$("#profile-detail").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-detail").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			});
		});
	</script>

	<!-- Add complaints -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
        $(document).ready(function () {
            $('#add-comp-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);
                $.ajax({
                    url: "AddCompServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        swal("Complaint submitted successfully.")
                            .then((value) => {
                                window.location = "u_profile.jsp"
                            });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Something went wrong. Please try again.");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
	</script>

</body>
</html>
<%
}
%>
