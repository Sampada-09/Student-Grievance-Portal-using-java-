package servletpkg;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import DAO.CompDAO;
import dbcon.ConnectionProvider;
import entities.Complaints;
import entities.Message;
import entities.User;
import helper.Helper;

@MultipartConfig
public class AddCompServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			String check = request.getParameter("check");

			if (check == null) {
				out.print("box not checked");
			} else {

				int id=Integer.parseInt(request.getParameter("cat_id"));
				String desc=request.getParameter("comp_description");
				String recipient=request.getParameter("recipient");

				Part part=request.getPart("comp_uploads");
				String imageName=part.getSubmittedFileName();

				HttpSession session=request.getSession();
				User user=(User)session.getAttribute("currentUser");

				Complaints com=new Complaints(user.getId(),id,desc,imageName,recipient);

				CompDAO dao=new CompDAO(ConnectionProvider.getCon());

				if(dao.saveComp(com)) {
					ServletContext context = getServletContext();

					// Get the real path for the root directory of your web application
					String uploadDirectory="D:/Eclipse-web/SCP/src/main/webapp/";

					// Assuming user.getProfile() returns the filename
					String profileImageFileName = part.getSubmittedFileName();

					// Construct the full path to the image directory using File.separator for platform independence
					String path = uploadDirectory + "docs" + File.separator + profileImageFileName;
					Helper.saveFile(part.getInputStream(), path);
					Message msg=new Message("Complaint Submitted Successfully", "success", "info");
					session.setAttribute("msg", msg);
					response.sendRedirect("u_profile.jsp");

				}else {
					Message msg=new Message("Error", "error", "info");

					session.setAttribute("msg", msg);
					response.sendRedirect("u_profile.jsp");
				}

			}

		} catch (Exception e) {
			// Properly handle any exceptions that occur during processing
			e.printStackTrace(); // For debugging purposes, you might want to log the exception
			response.getWriter().println("An error occurred. Please try again later.");
		}
	}
}