package servletpkg;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import entities.Message;

/**
 * Servlet implementation class LogoutServlet
 */
public class SignOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public SignOutServlet() {
    }
    
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
    	
        HttpSession session = request.getSession();
        session.removeAttribute("currentUser");
        
        Message msg = new Message("Logout Successfully", "success", "alert-success");
        session.setAttribute("msg", msg);
        
        
        try {
            response.sendRedirect("login_page.jsp");
        } catch (Exception e) {
        e.printStackTrace();     
        }
    }
}
