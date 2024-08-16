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
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.AccessDeniedException;

import DAO.UserDao;
import dbcon.ConnectionProvider;
import entities.Message;
import entities.User;
import helper.Helper;

@MultipartConfig
public class EditProfServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       

    public EditProfServlet() {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        processRequest(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try(PrintWriter out=response.getWriter()){



            //fetch form data

        String fullname=request.getParameter("fullname");
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        Part part=request.getPart("image");
        String imageName=part.getSubmittedFileName();

       
        //getting user from current session
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("currentUser");

        user.setEmail(email);
        user.setFullname(fullname);
        user.setPassword(password);
        user.setProfile(imageName);


        //update database...
        UserDao dao =new UserDao(ConnectionProvider.getCon());
        boolean result =dao.updateUser(user);

        if(result) {

        	ServletContext context = getServletContext();

            // Get the real path for the root directory of your web application
            String uploadDirectory="D:/Eclipse-web/SCP/src/main/webapp/";

            // Assuming user.getProfile() returns the filename
            String profileImageFileName = user.getProfile();

            // Construct the full path to the image directory using File.separator for platform independence
            String path = uploadDirectory + "img" + File.separator + profileImageFileName;

            if(Helper.saveFile(part.getInputStream(), path)) {
            	Message msg=new Message("Profile updated", "success", "info");
            	
            	session.setAttribute("msg", msg);
            	response.sendRedirect("u_profile.jsp");            
            }else {
            	Message msg=new Message("Something went wrong", "error", "danger");
            	response.sendRedirect("u_profile.jsp"); 		
            	session.setAttribute("msg", msg);   
            }
        }else {
            Message msg=new Message("Something went wrong..","error","alert-danger");
            session.setAttribute("msg", msg);
            }
        
        }catch (FileNotFoundException | AccessDeniedException e) {
            response.sendRedirect("u_profile.jsp");
        }catch (Exception e) {

            e.printStackTrace();
}
    }

}