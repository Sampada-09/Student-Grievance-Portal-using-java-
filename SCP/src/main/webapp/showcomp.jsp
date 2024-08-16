<%@page import="entities.Complaints"%>
<%@page import="dbcon.ConnectionProvider"%>
<%@page import="DAO.CompDAO"%>
<%@page import="entities.*"%>
<%@page import="java.util.List"%>
<%@page import="servletpkg.UpdateComServlet"%>

<%
Admin ad = (Admin) session.getAttribute("currentUser");
if (ad == null) {
	response.sendRedirect("home.jsp");
}
%>

<%
String compIdParam = request.getParameter("comp_id");
int compId;
if (compIdParam != null && !compIdParam.isEmpty()) {
	compId = Integer.parseInt(compIdParam);
} else {
	response.sendRedirect("error.jsp");
	return; // Added return statement to stop further execution
}

CompDAO dao = new CompDAO(ConnectionProvider.getCon());
Complaints com = dao.getCompbyCompId(compId);

if (com == null) {
	out.println("something went wrong");
	response.sendRedirect("a_profile.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/showcompstyles.css">


<style>
</style>
</head>

<body>
	<div class="container" >
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
		<h3 class="mt-2">Please Update Complaints Carefully</h3>
		<form id="update-data" action="UpdateCompServlet" method="post" enctype="multipart/form-data">
			
			<input type="hidden" id="hiddenCompId" name="hid" value="<%=compId%>">
			<table class="table">

				<tr>
					<td>Complaint ID :</td>
					<td><input type="text" class="form-control" name="name"
						value="<%=com.getComp_id()%>" onkeypress="return false;"></td>
				</tr>
				<tr>
					<td>Complaint Type :</td>
					<td><%=com.getCat_id()%></td>
				</tr>

				<tr>
					<td>Description :</td>
					<td><%=com.getComp_description()%></td>
				</tr>
				<tr>
					<td>Uploaded Documents :</td>
					<td>
						<%
						if (com.getComp_uploads() != null && !com.getComp_uploads().isEmpty()) {
						%> <%=com.getComp_uploads()%><br>
						<button class="btn btn-primary"
							onclick="window.open('docs/<%=com.getComp_uploads()%>', '_blank')">View
							Document</button> <%
 }
 %>

					</td>
				</tr>


				<tr>
					<td>Status :</td>
					<td><select name="status">
							<option disabled>Select status</option>

							<option value="pending">Pending</option>
							<option value="inprogress">In Progress</option>
							<option value="completed">Completed</option>
					</select>
				</tr>

				<tr>
					<td>Add Remark :</td>
					<td><textarea class="form-control" name="remark" cols="6"><%=com.getComp_remark()%></textarea>
					</td>

				</tr>
			</table>
			<div class="container">
				<button type="submit" class="btn btn-btn-primary">Update</button>

				<a class="btn btn-btn-primary" href="a_profile.jsp">close</a>
			</div>
		</form>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Check if the message is present in session
    <% if (session.getAttribute("msg") != null) { %>
        // Retrieve the message from session
        var msg = "<%= ((entities.Message)session.getAttribute("msg")).getContent() %>";
        var type = "<%= ((entities.Message)session.getAttribute("msg")).getType() %>";

        // Display SweetAlert2 based on the message type
        if (type === "success") {
            Swal.fire({
                title: 'Success!',
                text: msg,
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Redirect to a_profile.jsp
                    window.location.href = 'a_profile.jsp';
                }
            });
        } else if (type === "error") {
            Swal.fire({
                title: 'Error!',
                text: msg,
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Redirect to a_profile.jsp
                    window.location.href = 'a_profile.jsp';
                }
            });
        }
    <% } %>
</script>


<script>
$(document).ready(function(e) {
    console.log("Document is ready.");
    
    $("#update-data").on("submit", function(event) {
        event.preventDefault();
        console.log("triggered");
        let form = new FormData(this);
        
        // Now sending the request to the servlet
        $.ajax({
            url: "UpdateCompServlet",
            type: 'POST',
            data: form,
            processData: false,
            contentType: false,
            success: function(data, textStatus, jqXHR) {
                // Handle success response here
                console.log(data);
                alert("Complaint Updated Successfully!");
                response.sendredirect("a_profile.jsp");
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle error response here
                console.log("error");
                alert("Something went..Please Try again!");
            }
        });
    });
});
</script>

</script>


	<script>
        // Retrieve the hidden input element
        var hiddenCompIdInput = document.getElementById('hiddenCompId');

        // Get the value of the hidden input element
        var hiddenCompIdValue = hiddenCompIdInput.value;

        console.log("c",hiddenCompIdValue);
    </script>
</body>



</html>
