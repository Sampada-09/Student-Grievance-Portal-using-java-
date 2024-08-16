package servletpkg;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import DAO.AdminDAO;
import DAO.UserDao;
import dbcon.ConnectionProvider;
import entities.Admin;
import entities.Message;
import entities.User;

public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignInServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            // Check if the credentials belong to an admin
            AdminDAO adminDao = new AdminDAO(ConnectionProvider.getCon());
            Admin admin = adminDao.getAdminByEmailPassword(email, password);

            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", admin);
                response.sendRedirect("a_profile.jsp");
            } else {
                // If not admin, check if the credentials belong to a user
                UserDao userDao = new UserDao(ConnectionProvider.getCon());
                User user = userDao.getUserByEmailPassword(email, password);

                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", user);
                    response.sendRedirect("u_profile.jsp");
                } else {
                    // Neither admin nor user, show error message
                    Message msg = new Message("Invalid Login Details! Try Again", "error", "alert-danger");
                    HttpSession session = request.getSession();
                    session.setAttribute("msg", msg);
                    response.sendRedirect("login_page.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close(); // Close the PrintWriter
        }
    }
}
