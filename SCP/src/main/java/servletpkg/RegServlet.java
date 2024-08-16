package servletpkg;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.UserDao;
import dbcon.ConnectionProvider;
import entities.User;

@MultipartConfig
public class RegServlet extends HttpServlet {
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
        response.setContentType("text/plain");
        try (PrintWriter out = response.getWriter()) {
            String check = request.getParameter("check");

            if (check == null) {
                out.print("box not checked");
            } else {
                String fullname = request.getParameter("fullname");
                String email = request.getParameter("email");
                String rollno = request.getParameter("rollno");
                String password = request.getParameter("password");
                
                out.print(fullname);
                out.print(email);
                out.print(rollno);
                out.print(password);

                // Create user object
                User user = new User(fullname, email, rollno, password);

                // Create user dao object
                UserDao dao = new UserDao(ConnectionProvider.getCon());
                if (dao.saveUser(user)) {
                    out.print("done");
                } else {
                    out.print("error");
                }
            }
        } catch (Exception e) {
            // Send appropriate error message to the client
            response.getWriter().print("error");
            e.printStackTrace();
        }
    }
}
