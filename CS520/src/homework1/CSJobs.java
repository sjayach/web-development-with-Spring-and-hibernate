package homework1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CSJobs
 */
@WebServlet("/CSJobs")
public class CSJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void init() throws ServletException {
		ServletContext context = this.getServletContext();
		if (context.getAttribute("jobContext") == null) {

			List<JobBean> jobs = new ArrayList<JobBean>();
			context.setAttribute("jobContext", jobs);
		}
		if ( context.getAttribute("applicantContext") == null) {
			List<ApplicantBean> applicants = new ArrayList<ApplicantBean>();
			context.setAttribute("applicantContext", applicants);
		}
			
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/homework1/CSJobs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
