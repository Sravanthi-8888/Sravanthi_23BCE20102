package servlets;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import Election.UserService;

public class RegisterServlet extends HttpServlet {
  	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userid");
        String password = request.getParameter("password");

        UserService service = new UserService();
        if (service.registerUser(userId, password)) {
            response.sendRedirect("login.html");
        } else {
            response.getWriter().write("User already exists. <a href='register.html'>Try again</a>");
        }
    }
}
