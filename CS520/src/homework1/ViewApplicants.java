package homework1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewApplicants
 */
@WebServlet("/ViewApplicants")
public class ViewApplicants extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		// TODO Auto-generated method stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ServletContext context = this.getServletContext();
		List<ApplicantBean> applicants = (List<ApplicantBean>) context.getAttribute("applicantContext");
		List<JobBean> jobs = (List<JobBean>) context.getAttribute("jobContext");
		for (JobBean job : jobs) {
			if (job.getJobid() == Integer.parseInt(request.getParameter("id"))) {
				request.setAttribute("jobTitle", job.getJob());
				break;
			}
		}
		request.setAttribute("applicantsList", applicants);
		request.getRequestDispatcher("/WEB-INF/homework1/ViewApplicants.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
