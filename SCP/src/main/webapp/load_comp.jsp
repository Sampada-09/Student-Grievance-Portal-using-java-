<%@page import="entities.Admin"%>
<%@page import="DAO.CompDAO"%>
<%@page import="dbcon.ConnectionProvider"%>
<%@page import="entities.Complaints"%>
<%@page import="java.util.List"%>

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
Admin ad = (Admin) session.getAttribute("currentUser");
if (ad == null) {
    response.sendRedirect("home.jsp");
} else {
    int adminId = ad.getId(); // Assuming this method exists in your Admin class

    CompDAO dao = new CompDAO(ConnectionProvider.getCon());

    int cat_id = Integer.parseInt(request.getParameter("cat_id"));
    List<Complaints> comps = null;

    if (cat_id == 0) {
        comps = dao.getAllComp(adminId); // Pass the admin's ID here
    } else {
        comps = dao.getCompbyCatId(cat_id, adminId); // Pass the admin's ID here
    }

    if(comps.size()==0){
        out.println("<tr><td colspan='8' style='text-align: center;'>No complaints available</td></tr>");
    }
    for (Complaints c : comps) {
%>
		<tr>
			<td><%=c.getComp_id()%></td>
			<td><%=c.getComp_description()%></td>
			<td><%=c.getComp_uploads()%></td>
			<td><%=c.getComp_status()%></td>
			<td><%=c.getComp_remark()%></td>
			<td><a href="showcomp.jsp?comp_id=<%=c.getComp_id() %>"
				class="btn btn-outline-primary btn-sm"><i
					class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
		</tr>
		<%
    }
}
%>
</tbody>
</table>