package servletpkg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.CompDAO;
import dbcon.ConnectionProvider;
import entities.Message;

@MultipartConfig
public class UpdateCompServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateCompServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");
	    try (PrintWriter out = response.getWriter()) {
	        // Fetch form data
	        String compIdParam = request.getParameter("name");

	        String status = request.getParameter("status");
	        String remark = request.getParameter("remark");
	        out.println("Status: " + status);
	        out.println("Remark: " + remark);
	        if (compIdParam == null || compIdParam.isEmpty()) {
	            // Handle the case where compIdParam is null or empty
	            out.println("Complaint ID parameter is missing or empty."+compIdParam);
	            return; // Stop further execution
	        }
	        int compId = Integer.parseInt(compIdParam);
	        

	        // You can print these values to check if they are received correctly
	        out.println("Comp ID: " + compId);
	        
	        HttpSession session=request.getSession();
	        CompDAO dao= new CompDAO(ConnectionProvider.getCon());
	        
	        boolean result=dao.updateComp(compId, status, remark);
	        if (result) {
	            Message msg = new Message("Complaint updated", "success", "info");
	            session.setAttribute("msg", msg);
	            response.sendRedirect("a_profile.jsp");
	        } else {
	            Message msg = new Message("Something went wrong", "error", "danger");
	            session.setAttribute("msg", msg);
	            response.sendRedirect("a_profile.jsp");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
