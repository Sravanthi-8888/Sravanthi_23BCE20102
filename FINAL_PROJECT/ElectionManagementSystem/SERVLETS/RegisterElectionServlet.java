package servlets;

import Election.ElectionService;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.util.stream.*;

public class RegisterElectionServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	ElectionService service = new ElectionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String org = request.getParameter("organization");
        String electionName = request.getParameter("electionName");
        String date = request.getParameter("date");

        // Candidates and voters split by lines
        String[] voters = request.getParameter("voters").split("\\r?\\n");
       
		Set<String> voterSet = Arrays.stream(voters)
                .map(String::trim)
                .filter(v -> !v.isEmpty())
                .collect(Collectors.toSet());

service.createElection(org, electionName, date, voterSet);


        response.sendRedirect("index.html"); // or a success page
    }
}
