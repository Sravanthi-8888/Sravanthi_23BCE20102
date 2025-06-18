package servlets;

import Election.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userid");
        String password = request.getParameter("password");

        UserService service = new UserService();
        if (service.loginUser(userId, password)) {
            response.sendRedirect("dashboard.html");
        } else {
            response.getWriter().write("Login failed. <a href='login.html'>Try again</a>");
        }
    }
}
