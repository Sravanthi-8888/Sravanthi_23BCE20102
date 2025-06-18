package servlets;

import Election.VoterService;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CastVoteServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	VoterService service = new VoterService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String electionId = request.getParameter("electionId");
        String voterId = request.getParameter("voterId");
        String candidateId = request.getParameter("candidateId");

        service.castVote(electionId, voterId, candidateId);

        response.sendRedirect("dashboard.html");
    }
}
